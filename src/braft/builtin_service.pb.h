// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: braft/builtin_service.proto

#ifndef PROTOBUF_braft_2fbuiltin_5fservice_2eproto__INCLUDED
#define PROTOBUF_braft_2fbuiltin_5fservice_2eproto__INCLUDED

#include <string>

#include <google/protobuf/stubs/common.h>

#if GOOGLE_PROTOBUF_VERSION < 2004000
#error This file was generated by a newer version of protoc which is
#error incompatible with your Protocol Buffer headers.  Please update
#error your headers.
#endif
#if 2004001 < GOOGLE_PROTOBUF_MIN_PROTOC_VERSION
#error This file was generated by an older version of protoc which is
#error incompatible with your Protocol Buffer headers.  Please
#error regenerate this file with a newer version of protoc.
#endif

#include <google/protobuf/generated_message_util.h>
#include <google/protobuf/repeated_field.h>
#include <google/protobuf/extension_set.h>
#include <google/protobuf/generated_message_reflection.h>
#include <google/protobuf/service.h>
// @@protoc_insertion_point(includes)

namespace braft {

// Internal implementation detail -- do not call these.
void  protobuf_AddDesc_braft_2fbuiltin_5fservice_2eproto();
void protobuf_AssignDesc_braft_2fbuiltin_5fservice_2eproto();
void protobuf_ShutdownFile_braft_2fbuiltin_5fservice_2eproto();

class IndexRequest;
class IndexResponse;

// ===================================================================

class IndexRequest : public ::google::protobuf::Message {
 public:
  IndexRequest();
  virtual ~IndexRequest();
  
  IndexRequest(const IndexRequest& from);
  
  inline IndexRequest& operator=(const IndexRequest& from) {
    CopyFrom(from);
    return *this;
  }
  
  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const {
    return _unknown_fields_;
  }
  
  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields() {
    return &_unknown_fields_;
  }
  
  static const ::google::protobuf::Descriptor* descriptor();
  static const IndexRequest& default_instance();
  
  void Swap(IndexRequest* other);
  
  // implements Message ----------------------------------------------
  
  IndexRequest* New() const;
  void CopyFrom(const ::google::protobuf::Message& from);
  void MergeFrom(const ::google::protobuf::Message& from);
  void CopyFrom(const IndexRequest& from);
  void MergeFrom(const IndexRequest& from);
  void Clear();
  bool IsInitialized() const;
  
  int ByteSize() const;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input);
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const;
  ::google::protobuf::uint8* SerializeWithCachedSizesToArray(::google::protobuf::uint8* output) const;
  int GetCachedSize() const { return _cached_size_; }
  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const;
  public:
  
  ::google::protobuf::Metadata GetMetadata() const;
  
  // nested types ----------------------------------------------------
  
  // accessors -------------------------------------------------------
  
  // @@protoc_insertion_point(class_scope:braft.IndexRequest)
 private:
  
  ::google::protobuf::UnknownFieldSet _unknown_fields_;
  
  
  mutable int _cached_size_;
  ::google::protobuf::uint32 _has_bits_[1];
  
  friend void  protobuf_AddDesc_braft_2fbuiltin_5fservice_2eproto();
  friend void protobuf_AssignDesc_braft_2fbuiltin_5fservice_2eproto();
  friend void protobuf_ShutdownFile_braft_2fbuiltin_5fservice_2eproto();
  
  void InitAsDefaultInstance();
  static IndexRequest* default_instance_;
};
// -------------------------------------------------------------------

class IndexResponse : public ::google::protobuf::Message {
 public:
  IndexResponse();
  virtual ~IndexResponse();
  
  IndexResponse(const IndexResponse& from);
  
  inline IndexResponse& operator=(const IndexResponse& from) {
    CopyFrom(from);
    return *this;
  }
  
  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const {
    return _unknown_fields_;
  }
  
  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields() {
    return &_unknown_fields_;
  }
  
  static const ::google::protobuf::Descriptor* descriptor();
  static const IndexResponse& default_instance();
  
  void Swap(IndexResponse* other);
  
  // implements Message ----------------------------------------------
  
  IndexResponse* New() const;
  void CopyFrom(const ::google::protobuf::Message& from);
  void MergeFrom(const ::google::protobuf::Message& from);
  void CopyFrom(const IndexResponse& from);
  void MergeFrom(const IndexResponse& from);
  void Clear();
  bool IsInitialized() const;
  
  int ByteSize() const;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input);
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const;
  ::google::protobuf::uint8* SerializeWithCachedSizesToArray(::google::protobuf::uint8* output) const;
  int GetCachedSize() const { return _cached_size_; }
  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const;
  public:
  
  ::google::protobuf::Metadata GetMetadata() const;
  
  // nested types ----------------------------------------------------
  
  // accessors -------------------------------------------------------
  
  // @@protoc_insertion_point(class_scope:braft.IndexResponse)
 private:
  
  ::google::protobuf::UnknownFieldSet _unknown_fields_;
  
  
  mutable int _cached_size_;
  ::google::protobuf::uint32 _has_bits_[1];
  
  friend void  protobuf_AddDesc_braft_2fbuiltin_5fservice_2eproto();
  friend void protobuf_AssignDesc_braft_2fbuiltin_5fservice_2eproto();
  friend void protobuf_ShutdownFile_braft_2fbuiltin_5fservice_2eproto();
  
  void InitAsDefaultInstance();
  static IndexResponse* default_instance_;
};
// ===================================================================

class raft_stat_Stub;

class raft_stat : public ::google::protobuf::Service {
 protected:
  // This class should be treated as an abstract interface.
  inline raft_stat() {};
 public:
  virtual ~raft_stat();
  
  typedef raft_stat_Stub Stub;
  
  static const ::google::protobuf::ServiceDescriptor* descriptor();
  
  virtual void default_method(::google::protobuf::RpcController* controller,
                       const ::braft::IndexRequest* request,
                       ::braft::IndexResponse* response,
                       ::google::protobuf::Closure* done);
  
  // implements Service ----------------------------------------------
  
  const ::google::protobuf::ServiceDescriptor* GetDescriptor();
  void CallMethod(const ::google::protobuf::MethodDescriptor* method,
                  ::google::protobuf::RpcController* controller,
                  const ::google::protobuf::Message* request,
                  ::google::protobuf::Message* response,
                  ::google::protobuf::Closure* done);
  const ::google::protobuf::Message& GetRequestPrototype(
    const ::google::protobuf::MethodDescriptor* method) const;
  const ::google::protobuf::Message& GetResponsePrototype(
    const ::google::protobuf::MethodDescriptor* method) const;

 private:
  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(raft_stat);
};

class raft_stat_Stub : public raft_stat {
 public:
  raft_stat_Stub(::google::protobuf::RpcChannel* channel);
  raft_stat_Stub(::google::protobuf::RpcChannel* channel,
                   ::google::protobuf::Service::ChannelOwnership ownership);
  ~raft_stat_Stub();
  
  inline ::google::protobuf::RpcChannel* channel() { return channel_; }
  
  // implements raft_stat ------------------------------------------
  
  void default_method(::google::protobuf::RpcController* controller,
                       const ::braft::IndexRequest* request,
                       ::braft::IndexResponse* response,
                       ::google::protobuf::Closure* done);
 private:
  ::google::protobuf::RpcChannel* channel_;
  bool owns_channel_;
  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(raft_stat_Stub);
};


// ===================================================================


// ===================================================================

// IndexRequest

// -------------------------------------------------------------------

// IndexResponse


// @@protoc_insertion_point(namespace_scope)

}  // namespace braft

#ifndef SWIG
namespace google {
namespace protobuf {


}  // namespace google
}  // namespace protobuf
#endif  // SWIG

// @@protoc_insertion_point(global_scope)

#endif  // PROTOBUF_braft_2fbuiltin_5fservice_2eproto__INCLUDED
