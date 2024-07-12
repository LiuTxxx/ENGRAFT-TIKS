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

#ifndef BRPC_POLICY_CONSTANT_CONCURRENCY_LIMITER_H
#define BRPC_POLICY_CONSTANT_CONCURRENCY_LIMITER_H

#include "brpc/concurrency_limiter.h"
#include "sgxbutil/atomicops.h"

namespace brpc {
namespace policy {

class ConstantConcurrencyLimiter : public ConcurrencyLimiter {
public:
    explicit ConstantConcurrencyLimiter(int max_concurrency);
    
    bool OnRequested(int current_concurrency) override;
    
    void OnResponded(int error_code, int64_t latency_us) override;

    int MaxConcurrency() override;

    ConstantConcurrencyLimiter* New(const AdaptiveMaxConcurrency&) const override;

private:
    sgxbutil::atomic<int> _max_concurrency;
};

}  // namespace policy
}  // namespace brpc


#endif // BRPC_POLICY_CONSTANT_CONCURRENCY_LIMITER_H
