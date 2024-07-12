// Licensed to the Apache Software Foundation (ASF) under one
// or more contributor license agreements.  See the NOTICE file
// distributed with this work for additional information
// regarding copyright ownership.  The ASF licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

// bthread - A M:N threading library to make applications more concurrent.

// Date: Wed Mar 14 17:44:58 CST 2018

#include "bthread/sys_futex.h"
#include "sgxbutil/scoped_lock.h"
#include "sgxbutil/atomicops.h"
#include <pthread.h>
#include <unordered_map>
#include <algorithm>

#if RUN_OUTSIDE_SGX
#include "host/host_utils.h"
#else 
#include "interface_t.h"
#endif

//- Simulated futex impl for enclaves
namespace bthread {

class SimuFutex {
public:
    SimuFutex() : counts(0)
                , ref(0) {
        pthread_mutex_init(&lock, NULL);
        pthread_cond_init(&cond, NULL);
    }
    ~SimuFutex() {
        pthread_mutex_destroy(&lock);
        pthread_cond_destroy(&cond);
    }

public:
    pthread_mutex_t lock;
    pthread_cond_t cond;
    int32_t counts;
    int32_t ref;
};

static pthread_mutex_t s_futex_map_mutex = PTHREAD_MUTEX_INITIALIZER;
static pthread_once_t init_futex_map_once = PTHREAD_ONCE_INIT;
static std::unordered_map<void*, SimuFutex>* s_futex_map = NULL;
static void InitFutexMap() {
    // Leave memory to process's clean up.
    s_futex_map = new (std::nothrow) std::unordered_map<void*, SimuFutex>();
    if (NULL == s_futex_map) {
        exit(1);
    }
    return;
}

int futex_wait_private(void* addr1, int expected, const timespec* timeout) {
    if (timeout != NULL) {
        LOG(FATAL) << "Func: " << __FUNCTION__ << " Futex with timeout should use another set of futex functions!";
        return -1;
    }
    if (pthread_once(&init_futex_map_once, InitFutexMap) != 0) {
        LOG(FATAL) << "Fail to pthread_once";
        exit(1);
    }
    std::unique_lock<pthread_mutex_t> mu(s_futex_map_mutex);
    SimuFutex& simu_futex = (*s_futex_map)[addr1];
    ++simu_futex.ref;
    mu.unlock();

    int rc = 0;
    {
        std::unique_lock<pthread_mutex_t> mu1(simu_futex.lock);
        if (static_cast<sgxbutil::atomic<int>*>(addr1)->load() == expected) {
            ++simu_futex.counts;
            if ((rc = pthread_cond_wait(&simu_futex.cond, &simu_futex.lock)) != 0) {
                errno = rc;
                rc = -1;
            }
            --simu_futex.counts;
        } else {
            errno = EAGAIN;
            rc = -1;
        }
    }

    std::unique_lock<pthread_mutex_t> mu1(s_futex_map_mutex);
    if (--simu_futex.ref == 0) {
        s_futex_map->erase(addr1);
    }
    mu1.unlock();
    return rc;
}

int futex_wake_private(void* addr1, int nwake) {
    if (pthread_once(&init_futex_map_once, InitFutexMap) != 0) {
        LOG(FATAL) << "Fail to pthread_once";
        exit(1);
    }
    std::unique_lock<pthread_mutex_t> mu(s_futex_map_mutex);
    auto it = s_futex_map->find(addr1);
    if (it == s_futex_map->end()) {
        mu.unlock();
        return 0;
    }
    SimuFutex& simu_futex = it->second;
    ++simu_futex.ref;
    mu.unlock();

    int nwakedup = 0;
    int rc = 0;
    {
        std::unique_lock<pthread_mutex_t> mu1(simu_futex.lock);
        nwake = (nwake < simu_futex.counts)? nwake: simu_futex.counts;
        for (int i = 0; i < nwake; ++i) {
            if ((rc = pthread_cond_signal(&simu_futex.cond)) != 0) {
                errno = rc;
                break;
            } else {
                ++nwakedup;
            }
        }
    }

    std::unique_lock<pthread_mutex_t> mu2(s_futex_map_mutex);
    if (--simu_futex.ref == 0) {
        s_futex_map->erase(addr1);
    }
    mu2.unlock();
    return nwakedup;
}

int futex_wait_timeout(void* addr1, int expected, timespec* timeout) {
    // if (timeout == NULL) {
    //     LOG(FATAL) << "Func: " << __FUNCTION__ << " Futex without timeout should use another set of futex functions!";
    //     return -1;
    // }
    int ret = 0;
    int errnum = 0;
    // LOG(INFO) << "Func: " << __FUNCTION__ << " addr = " << addr1
    //     << "; addr1_val = " << *(int*)addr1;
    // if (timeout != NULL) {
    //     LOG(INFO) << "Func: " << __FUNCTION__ << " sec = " << timeout->tv_sec
    //         << " nsec = " << timeout->tv_nsec;
    // }
    ocall_futex_wait_private(addr1, expected, timeout, &ret, &errnum);
    if (ret != 0) {
        errno = errnum;
    }
    // LOG(INFO) << "Func: " << __FUNCTION__ << " wait finished";
    return ret;
}

int futex_wake_timeout(void* addr1, int nwake) {
    // LOG(INFO) << "Func: " << __FUNCTION__ << " addr = " << addr1
    //     << "; addr1_val = " << *(int*)addr1;
    int ret = 0;
    int errnum = 0;
    ocall_futex_wake_private(addr1, nwake, &ret, &errnum);
    // LOG(INFO) << "Func: " << __FUNCTION__ << " ret = " << ret
    //     << "; errnum = " << errnum;
    if (ret < 0) {
        errno = errnum;
    }
    return ret;
}

} // namespace bthread