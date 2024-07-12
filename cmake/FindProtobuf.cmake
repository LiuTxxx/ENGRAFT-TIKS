message(STATUS "HELLO FROM FINDROTOBUF.CMAKE")
# set(PROTOBUF_INCLUDE_DIRS "/usr/include" CACHE INTERNAL "")
# set(PROTOBUF_INCLUDE_DIR "/usr/include" CACHE INTERNAL "")
set(PROTOBUF_INCLUDE_DIR "/root/code_dev/protobuf-2.4.1/installed/include" CACHE INTERNAL "")
# set(PROTOBUF_LIBRARIES "/usr/lib/x86_64-linux-gnu/libprotobuf.so" CACHE INTERNAL "")
# set(PROTOC_LIB "/usr/lib/x86_64-linux-gnu/libprotoc.so" CACHE INTERNAL "")
# set(PROTOBUF_PROTOC_EXECUTABLE "/usr/bin/protoc" CACHE INTERNAL "")
set(PROTOBUF_PROTOC_EXECUTABLE "/root/code_dev/protobuf-2.4.1/installed/bin/protoc" CACHE INTERNAL "")
# set(PROTOC_FLAGS "-I/usr/include" CACHE INTERNAL "")
set(PROTOC_FLAGS "-I/root/code_dev/protobuf-2.4.1/installed/include" CACHE INTERNAL "")


# Comment out the following code from 
# /usr/local/cmake-3.13.1-Linux-x86_64/share/cmake-3.13/Modules/FindProtobuf.cmake
# And use the above code to manually set environment variables of protobuf
##########################################################################################
##########################################################################################
##########################################################################################


# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

#.rst:
# FindProtobuf
# ------------
#
# Locate and configure the Google Protocol Buffers library.
#
# The following variables can be set and are optional:
#
# ``Protobuf_SRC_ROOT_FOLDER``
#   When compiling with MSVC, if this cache variable is set
#   the protobuf-default VS project build locations
#   (vsprojects/Debug and vsprojects/Release
#   or vsprojects/x64/Debug and vsprojects/x64/Release)
#   will be searched for libraries and binaries.
# ``Protobuf_IMPORT_DIRS``
#   List of additional directories to be searched for
#   imported .proto files.
# ``Protobuf_DEBUG``
#   Show debug messages.
# ``Protobuf_USE_STATIC_LIBS``
#   Set to ON to force the use of the static libraries.
#   Default is OFF.
#
# Defines the following variables:
#
# ``Protobuf_FOUND``
#   Found the Google Protocol Buffers library
#   (libprotobuf & header files)
# ``Protobuf_VERSION``
#   Version of package found.
# ``Protobuf_INCLUDE_DIRS``*
#   Include directories for Google Protocol Buffers
# ``Protobuf_LIBRARIES``*
#   The protobuf libraries
# ``Protobuf_PROTOC_LIBRARIES``
#   The protoc libraries
# ``Protobuf_LITE_LIBRARIES``
#   The protobuf-lite libraries
#
# The following :prop_tgt:`IMPORTED` targets are also defined:
#
# ``protobuf::libprotobuf``
#   The protobuf library.
# ``protobuf::libprotobuf-lite``
#   The protobuf lite library.
# ``protobuf::libprotoc``
#   The protoc library.
# ``protobuf::protoc``
#   The protoc compiler.
#
# The following cache variables are also available to set or use:
#
# ``Protobuf_LIBRARY``
#   The protobuf library
# ``Protobuf_PROTOC_LIBRARY``
#   The protoc library
# ``Protobuf_INCLUDE_DIR``
#   The include directory for protocol buffers
# ``Protobuf_PROTOC_EXECUTABLE``
#   The protoc compiler
# ``Protobuf_LIBRARY_DEBUG``
#   The protobuf library (debug)
# ``Protobuf_PROTOC_LIBRARY_DEBUG``
#   The protoc library (debug)
# ``Protobuf_LITE_LIBRARY``
#   The protobuf lite library
# ``Protobuf_LITE_LIBRARY_DEBUG``
#   The protobuf lite library (debug)
#
# Example:
#
# .. code-block:: cmake
#
#   find_package(Protobuf REQUIRED)
#   include_directories(${Protobuf_INCLUDE_DIRS})
#   include_directories(${CMAKE_CURRENT_BINARY_DIR})
#   protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS foo.proto)
#   protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS EXPORT_MACRO DLL_EXPORT foo.proto)
#   protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS DESCRIPTORS PROTO_DESCS foo.proto)
#   protobuf_generate_python(PROTO_PY foo.proto)
#   add_executable(bar bar.cc ${PROTO_SRCS} ${PROTO_HDRS})
#   target_link_libraries(bar ${Protobuf_LIBRARIES})
#
# .. note::
#   The ``protobuf_generate_cpp`` and ``protobuf_generate_python``
#   functions and :command:`add_executable` or :command:`add_library`
#   calls only work properly within the same directory.
#
# .. command:: protobuf_generate_cpp
#
#   Add custom commands to process ``.proto`` files to C++::
#
#     protobuf_generate_cpp (<SRCS> <HDRS>
#         [DESCRIPTORS <DESC>] [EXPORT_MACRO <MACRO>] [<ARGN>...])
#
#   ``SRCS``
#     Variable to define with autogenerated source files
#   ``HDRS``
#     Variable to define with autogenerated header files
#   ``DESCRIPTORS``
#     Variable to define with autogenerated descriptor files, if requested.
#   ``EXPORT_MACRO``
#     is a macro which should expand to ``__declspec(dllexport)`` or
#     ``__declspec(dllimport)`` depending on what is being compiled.
#   ``ARGN``
#     ``.proto`` files
#
# .. command:: protobuf_generate_python
#
#   Add custom commands to process ``.proto`` files to Python::
#
#     protobuf_generate_python (<PY> [<ARGN>...])
#
#   ``PY``
#     Variable to define with autogenerated Python files
#   ``ARGN``
#     ``.proto`` filess

# function(protobuf_generate)
#   include(CMakeParseArguments)

#   set(_options APPEND_PATH DESCRIPTORS)
#   set(_singleargs LANGUAGE OUT_VAR EXPORT_MACRO PROTOC_OUT_DIR)
#   if(COMMAND target_sources)
#     list(APPEND _singleargs TARGET)
#   endif()
#   set(_multiargs PROTOS IMPORT_DIRS GENERATE_EXTENSIONS)

#   cmake_parse_arguments(protobuf_generate "${_options}" "${_singleargs}" "${_multiargs}" "${ARGN}")

#   if(NOT protobuf_generate_PROTOS AND NOT protobuf_generate_TARGET)
#     message(SEND_ERROR "Error: protobuf_generate called without any targets or source files")
#     return()
#   endif()

#   if(NOT protobuf_generate_OUT_VAR AND NOT protobuf_generate_TARGET)
#     message(SEND_ERROR "Error: protobuf_generate called without a target or output variable")
#     return()
#   endif()

#   if(NOT protobuf_generate_LANGUAGE)
#     set(protobuf_generate_LANGUAGE cpp)
#   endif()
#   string(TOLOWER ${protobuf_generate_LANGUAGE} protobuf_generate_LANGUAGE)

#   if(NOT protobuf_generate_PROTOC_OUT_DIR)
#     set(protobuf_generate_PROTOC_OUT_DIR ${CMAKE_CURRENT_BINARY_DIR})
#   endif()

#   if(protobuf_generate_EXPORT_MACRO AND protobuf_generate_LANGUAGE STREQUAL cpp)
#     set(_dll_export_decl "dllexport_decl=${protobuf_generate_EXPORT_MACRO}:")
#   endif()

#   if(NOT protobuf_generate_GENERATE_EXTENSIONS)
#     if(protobuf_generate_LANGUAGE STREQUAL cpp)
#       set(protobuf_generate_GENERATE_EXTENSIONS .pb.h .pb.cc)
#     elseif(protobuf_generate_LANGUAGE STREQUAL python)
#       set(protobuf_generate_GENERATE_EXTENSIONS _pb2.py)
#     else()
#       message(SEND_ERROR "Error: protobuf_generate given unknown Language ${LANGUAGE}, please provide a value for GENERATE_EXTENSIONS")
#       return()
#     endif()
#   endif()

#   if(protobuf_generate_TARGET)
#     get_target_property(_source_list ${protobuf_generate_TARGET} SOURCES)
#     foreach(_file ${_source_list})
#       if(_file MATCHES "proto$")
#         list(APPEND protobuf_generate_PROTOS ${_file})
#       endif()
#     endforeach()
#   endif()

#   if(NOT protobuf_generate_PROTOS)
#     message(SEND_ERROR "Error: protobuf_generate could not find any .proto files")
#     return()
#   endif()

#   if(protobuf_generate_APPEND_PATH)
#     # Create an include path for each file specified
#     foreach(_file ${protobuf_generate_PROTOS})
#       get_filename_component(_abs_file ${_file} ABSOLUTE)
#       get_filename_component(_abs_path ${_abs_file} PATH)
#       list(FIND _protobuf_include_path ${_abs_path} _contains_already)
#       if(${_contains_already} EQUAL -1)
#           list(APPEND _protobuf_include_path -I ${_abs_path})
#       endif()
#     endforeach()
#   else()
#     set(_protobuf_include_path -I ${CMAKE_CURRENT_SOURCE_DIR})
#   endif()

#   foreach(DIR ${protobuf_generate_IMPORT_DIRS})
#     get_filename_component(ABS_PATH ${DIR} ABSOLUTE)
#     list(FIND _protobuf_include_path ${ABS_PATH} _contains_already)
#     if(${_contains_already} EQUAL -1)
#         list(APPEND _protobuf_include_path -I ${ABS_PATH})
#     endif()
#   endforeach()

#   set(_generated_srcs_all)
#   foreach(_proto ${protobuf_generate_PROTOS})
#     get_filename_component(_abs_file ${_proto} ABSOLUTE)
#     get_filename_component(_abs_dir ${_abs_file} DIRECTORY)
#     get_filename_component(_basename ${_proto} NAME_WE)
#     file(RELATIVE_PATH _rel_dir ${CMAKE_CURRENT_SOURCE_DIR} ${_abs_dir})

#     set(_generated_srcs)
#     foreach(_ext ${protobuf_generate_GENERATE_EXTENSIONS})
#       list(APPEND _generated_srcs "${protobuf_generate_PROTOC_OUT_DIR}/${_basename}${_ext}")
#     endforeach()

#     if(protobuf_generate_DESCRIPTORS AND protobuf_generate_LANGUAGE STREQUAL cpp)
#       set(_descriptor_file "${CMAKE_CURRENT_BINARY_DIR}/${_basename}.desc")
#       set(_dll_desc_out "--descriptor_set_out=${_descriptor_file}")
#       list(APPEND _generated_srcs ${_descriptor_file})
#     endif()
#     list(APPEND _generated_srcs_all ${_generated_srcs})

#     add_custom_command(
#       OUTPUT ${_generated_srcs}
#       COMMAND  protobuf::protoc
#       ARGS --${protobuf_generate_LANGUAGE}_out ${_dll_export_decl}${protobuf_generate_PROTOC_OUT_DIR} ${_dll_desc_out} ${_protobuf_include_path} ${_abs_file}
#       DEPENDS ${_abs_file} protobuf::protoc
#       COMMENT "Running ${protobuf_generate_LANGUAGE} protocol buffer compiler on ${_proto}"
#       VERBATIM )
#   endforeach()

#   set_source_files_properties(${_generated_srcs_all} PROPERTIES GENERATED TRUE)
#   if(protobuf_generate_OUT_VAR)
#     set(${protobuf_generate_OUT_VAR} ${_generated_srcs_all} PARENT_SCOPE)
#   endif()
#   if(protobuf_generate_TARGET)
#     target_sources(${protobuf_generate_TARGET} PRIVATE ${_generated_srcs_all})
#   endif()
# endfunction()

# function(PROTOBUF_GENERATE_CPP SRCS HDRS)
#   cmake_parse_arguments(protobuf_generate_cpp "" "EXPORT_MACRO;DESCRIPTORS" "" ${ARGN})

#   set(_proto_files "${protobuf_generate_cpp_UNPARSED_ARGUMENTS}")
#   if(NOT _proto_files)
#     message(SEND_ERROR "Error: PROTOBUF_GENERATE_CPP() called without any proto files")
#     return()
#   endif()

#   if(PROTOBUF_GENERATE_CPP_APPEND_PATH)
#     set(_append_arg APPEND_PATH)
#   endif()

#   if(protobuf_generate_cpp_DESCRIPTORS)
#     set(_descriptors DESCRIPTORS)
#   endif()

#   if(DEFINED PROTOBUF_IMPORT_DIRS AND NOT DEFINED Protobuf_IMPORT_DIRS)
#     set(Protobuf_IMPORT_DIRS "${PROTOBUF_IMPORT_DIRS}")
#   endif()

#   if(DEFINED Protobuf_IMPORT_DIRS)
#     set(_import_arg IMPORT_DIRS ${Protobuf_IMPORT_DIRS})
#   endif()

#   set(_outvar)
#   protobuf_generate(${_append_arg} ${_descriptors} LANGUAGE cpp EXPORT_MACRO ${protobuf_generate_cpp_EXPORT_MACRO} OUT_VAR _outvar ${_import_arg} PROTOS ${_proto_files})

#   set(${SRCS})
#   set(${HDRS})
#   if(protobuf_generate_cpp_DESCRIPTORS)
#     set(${protobuf_generate_cpp_DESCRIPTORS})
#   endif()

#   foreach(_file ${_outvar})
#     if(_file MATCHES "cc$")
#       list(APPEND ${SRCS} ${_file})
#     elseif(_file MATCHES "desc$")
#       list(APPEND ${protobuf_generate_cpp_DESCRIPTORS} ${_file})
#     else()
#       list(APPEND ${HDRS} ${_file})
#     endif()
#   endforeach()
#   set(${SRCS} ${${SRCS}} PARENT_SCOPE)
#   set(${HDRS} ${${HDRS}} PARENT_SCOPE)
#   if(protobuf_generate_cpp_DESCRIPTORS)
#     set(${protobuf_generate_cpp_DESCRIPTORS} "${${protobuf_generate_cpp_DESCRIPTORS}}" PARENT_SCOPE)
#   endif()
# endfunction()

# function(PROTOBUF_GENERATE_PYTHON SRCS)
#   if(NOT ARGN)
#     message(SEND_ERROR "Error: PROTOBUF_GENERATE_PYTHON() called without any proto files")
#     return()
#   endif()

#   if(PROTOBUF_GENERATE_CPP_APPEND_PATH)
#     set(_append_arg APPEND_PATH)
#   endif()

#   if(DEFINED PROTOBUF_IMPORT_DIRS AND NOT DEFINED Protobuf_IMPORT_DIRS)
#     set(Protobuf_IMPORT_DIRS "${PROTOBUF_IMPORT_DIRS}")
#   endif()

#   if(DEFINED Protobuf_IMPORT_DIRS)
#     set(_import_arg IMPORT_DIRS ${Protobuf_IMPORT_DIRS})
#   endif()

#   set(_outvar)
#   protobuf_generate(${_append_arg} LANGUAGE python OUT_VAR _outvar ${_import_arg} PROTOS ${ARGN})
#   set(${SRCS} ${_outvar} PARENT_SCOPE)
# endfunction()


# if(Protobuf_DEBUG)
#   # Output some of their choices
#   message(STATUS "[ ${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE} ] "
#                  "Protobuf_USE_STATIC_LIBS = ${Protobuf_USE_STATIC_LIBS}")
# endif()


# # Backwards compatibility
# # Define camel case versions of input variables
# foreach(UPPER
#     PROTOBUF_SRC_ROOT_FOLDER
#     PROTOBUF_IMPORT_DIRS
#     PROTOBUF_DEBUG
#     PROTOBUF_LIBRARY
#     PROTOBUF_PROTOC_LIBRARY
#     PROTOBUF_INCLUDE_DIR
#     PROTOBUF_PROTOC_EXECUTABLE
#     PROTOBUF_LIBRARY_DEBUG
#     PROTOBUF_PROTOC_LIBRARY_DEBUG
#     PROTOBUF_LITE_LIBRARY
#     PROTOBUF_LITE_LIBRARY_DEBUG
#     )
#     if (DEFINED ${UPPER})
#         string(REPLACE "PROTOBUF_" "Protobuf_" Camel ${UPPER})
#         if (NOT DEFINED ${Camel})
#             set(${Camel} ${${UPPER}})
#         endif()
#     endif()
# endforeach()

# if(CMAKE_SIZEOF_VOID_P EQUAL 8)
#   set(_PROTOBUF_ARCH_DIR x64/)
# endif()


# # Support preference of static libs by adjusting CMAKE_FIND_LIBRARY_SUFFIXES
# if( Protobuf_USE_STATIC_LIBS )
#   set( _protobuf_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES})
#   if(WIN32)
#     set(CMAKE_FIND_LIBRARY_SUFFIXES .lib .a ${CMAKE_FIND_LIBRARY_SUFFIXES})
#   else()
#     set(CMAKE_FIND_LIBRARY_SUFFIXES .a )
#   endif()
# endif()

# include(${CMAKE_CURRENT_LIST_DIR}/SelectLibraryConfigurations.cmake)

# # Internal function: search for normal library as well as a debug one
# #    if the debug one is specified also include debug/optimized keywords
# #    in *_LIBRARIES variable
# function(_protobuf_find_libraries name filename)
#   if(${name}_LIBRARIES)
#     # Use result recorded by a previous call.
#     return()
#   elseif(${name}_LIBRARY)
#     # Honor cache entry used by CMake 3.5 and lower.
#     set(${name}_LIBRARIES "${${name}_LIBRARY}" PARENT_SCOPE)
#   else()
#     find_library(${name}_LIBRARY_RELEASE
#       NAMES ${filename}
#       PATHS ${Protobuf_SRC_ROOT_FOLDER}/vsprojects/${_PROTOBUF_ARCH_DIR}Release)
#     mark_as_advanced(${name}_LIBRARY_RELEASE)

#     find_library(${name}_LIBRARY_DEBUG
#       NAMES ${filename}d ${filename}
#       PATHS ${Protobuf_SRC_ROOT_FOLDER}/vsprojects/${_PROTOBUF_ARCH_DIR}Debug)
#     mark_as_advanced(${name}_LIBRARY_DEBUG)

#     select_library_configurations(${name})

#     if(UNIX AND Threads_FOUND)
#       list(APPEND ${name}_LIBRARIES ${CMAKE_THREAD_LIBS_INIT})
#     endif()

#     set(${name}_LIBRARY "${${name}_LIBRARY}" PARENT_SCOPE)
#     set(${name}_LIBRARIES "${${name}_LIBRARIES}" PARENT_SCOPE)
#   endif()
# endfunction()

# #
# # Main.
# #

# # By default have PROTOBUF_GENERATE_CPP macro pass -I to protoc
# # for each directory where a proto file is referenced.
# if(NOT DEFINED PROTOBUF_GENERATE_CPP_APPEND_PATH)
#   set(PROTOBUF_GENERATE_CPP_APPEND_PATH TRUE)
# endif()


# # Google's provided vcproj files generate libraries with a "lib"
# # prefix on Windows
# if(MSVC)
#     set(Protobuf_ORIG_FIND_LIBRARY_PREFIXES "${CMAKE_FIND_LIBRARY_PREFIXES}")
#     set(CMAKE_FIND_LIBRARY_PREFIXES "lib" "")

#     find_path(Protobuf_SRC_ROOT_FOLDER protobuf.pc.in)
# endif()

# if(UNIX)
#   # Protobuf headers may depend on threading.
#   find_package(Threads QUIET)
# endif()

# # The Protobuf library
# _protobuf_find_libraries(Protobuf protobuf)
# #DOC "The Google Protocol Buffers RELEASE Library"

# _protobuf_find_libraries(Protobuf_LITE protobuf-lite)

# # The Protobuf Protoc Library
# _protobuf_find_libraries(Protobuf_PROTOC protoc)

# # Restore original find library prefixes
# if(MSVC)
#     set(CMAKE_FIND_LIBRARY_PREFIXES "${Protobuf_ORIG_FIND_LIBRARY_PREFIXES}")
# endif()

# # Find the include directory
# find_path(Protobuf_INCLUDE_DIR
#     google/protobuf/service.h
#     PATHS ${Protobuf_SRC_ROOT_FOLDER}/src
# )
# mark_as_advanced(Protobuf_INCLUDE_DIR)

# # Find the protoc Executable
# find_program(Protobuf_PROTOC_EXECUTABLE
#     NAMES protoc
#     DOC "The Google Protocol Buffers Compiler"
#     PATHS
#     ${Protobuf_SRC_ROOT_FOLDER}/vsprojects/${_PROTOBUF_ARCH_DIR}Release
#     ${Protobuf_SRC_ROOT_FOLDER}/vsprojects/${_PROTOBUF_ARCH_DIR}Debug
# )
# mark_as_advanced(Protobuf_PROTOC_EXECUTABLE)

# if(Protobuf_DEBUG)
#     message(STATUS "[ ${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE} ] "
#         "requested version of Google Protobuf is ${Protobuf_FIND_VERSION}")
# endif()

# if(Protobuf_INCLUDE_DIR)
#   set(_PROTOBUF_COMMON_HEADER ${Protobuf_INCLUDE_DIR}/google/protobuf/stubs/common.h)

#   if(Protobuf_DEBUG)
#     message(STATUS "[ ${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE} ] "
#                    "location of common.h: ${_PROTOBUF_COMMON_HEADER}")
#   endif()

#   set(Protobuf_VERSION "")
#   set(Protobuf_LIB_VERSION "")
#   file(STRINGS ${_PROTOBUF_COMMON_HEADER} _PROTOBUF_COMMON_H_CONTENTS REGEX "#define[ \t]+GOOGLE_PROTOBUF_VERSION[ \t]+")
#   if(_PROTOBUF_COMMON_H_CONTENTS MATCHES "#define[ \t]+GOOGLE_PROTOBUF_VERSION[ \t]+([0-9]+)")
#       set(Protobuf_LIB_VERSION "${CMAKE_MATCH_1}")
#   endif()
#   unset(_PROTOBUF_COMMON_H_CONTENTS)

#   math(EXPR _PROTOBUF_MAJOR_VERSION "${Protobuf_LIB_VERSION} / 1000000")
#   math(EXPR _PROTOBUF_MINOR_VERSION "${Protobuf_LIB_VERSION} / 1000 % 1000")
#   math(EXPR _PROTOBUF_SUBMINOR_VERSION "${Protobuf_LIB_VERSION} % 1000")
#   set(Protobuf_VERSION "${_PROTOBUF_MAJOR_VERSION}.${_PROTOBUF_MINOR_VERSION}.${_PROTOBUF_SUBMINOR_VERSION}")

#   if(Protobuf_DEBUG)
#     message(STATUS "[ ${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE} ] "
#         "${_PROTOBUF_COMMON_HEADER} reveals protobuf ${Protobuf_VERSION}")
#   endif()

#   # Check Protobuf compiler version to be aligned with libraries version
#   execute_process(COMMAND ${Protobuf_PROTOC_EXECUTABLE} --version
#                   OUTPUT_VARIABLE _PROTOBUF_PROTOC_EXECUTABLE_VERSION)

#   if("${_PROTOBUF_PROTOC_EXECUTABLE_VERSION}" MATCHES "libprotoc ([0-9.]+)")
#     set(_PROTOBUF_PROTOC_EXECUTABLE_VERSION "${CMAKE_MATCH_1}")
#   endif()

#   if(Protobuf_DEBUG)
#     message(STATUS "[ ${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE} ] "
#         "${Protobuf_PROTOC_EXECUTABLE} reveals version ${_PROTOBUF_PROTOC_EXECUTABLE_VERSION}")
#   endif()

#   if(NOT "${_PROTOBUF_PROTOC_EXECUTABLE_VERSION}" VERSION_EQUAL "${Protobuf_VERSION}")
#       message(WARNING "Protobuf compiler version ${_PROTOBUF_PROTOC_EXECUTABLE_VERSION}"
#           " doesn't match library version ${Protobuf_VERSION}")
#   endif()

#   if(Protobuf_LIBRARY)
#       if(NOT TARGET protobuf::libprotobuf)
#           add_library(protobuf::libprotobuf UNKNOWN IMPORTED)
#           set_target_properties(protobuf::libprotobuf PROPERTIES
#             INTERFACE_INCLUDE_DIRECTORIES "${Protobuf_INCLUDE_DIR}")
#           if(EXISTS "${Protobuf_LIBRARY}")
#             set_target_properties(protobuf::libprotobuf PROPERTIES
#               IMPORTED_LOCATION "${Protobuf_LIBRARY}")
#           endif()
#           if(EXISTS "${Protobuf_LIBRARY_RELEASE}")
#             set_property(TARGET protobuf::libprotobuf APPEND PROPERTY
#               IMPORTED_CONFIGURATIONS RELEASE)
#             set_target_properties(protobuf::libprotobuf PROPERTIES
#               IMPORTED_LOCATION_RELEASE "${Protobuf_LIBRARY_RELEASE}")
#           endif()
#           if(EXISTS "${Protobuf_LIBRARY_DEBUG}")
#             set_property(TARGET protobuf::libprotobuf APPEND PROPERTY
#               IMPORTED_CONFIGURATIONS DEBUG)
#             set_target_properties(protobuf::libprotobuf PROPERTIES
#               IMPORTED_LOCATION_DEBUG "${Protobuf_LIBRARY_DEBUG}")
#           endif()
#           if(UNIX AND TARGET Threads::Threads)
#             set_property(TARGET protobuf::libprotobuf APPEND PROPERTY
#                 INTERFACE_LINK_LIBRARIES Threads::Threads)
#           endif()
#       endif()
#   endif()

#   if(Protobuf_LITE_LIBRARY)
#       if(NOT TARGET protobuf::libprotobuf-lite)
#           add_library(protobuf::libprotobuf-lite UNKNOWN IMPORTED)
#           set_target_properties(protobuf::libprotobuf-lite PROPERTIES
#             INTERFACE_INCLUDE_DIRECTORIES "${Protobuf_INCLUDE_DIR}")
#           if(EXISTS "${Protobuf_LITE_LIBRARY}")
#             set_target_properties(protobuf::libprotobuf-lite PROPERTIES
#               IMPORTED_LOCATION "${Protobuf_LITE_LIBRARY}")
#           endif()
#           if(EXISTS "${Protobuf_LITE_LIBRARY_RELEASE}")
#             set_property(TARGET protobuf::libprotobuf-lite APPEND PROPERTY
#               IMPORTED_CONFIGURATIONS RELEASE)
#             set_target_properties(protobuf::libprotobuf-lite PROPERTIES
#               IMPORTED_LOCATION_RELEASE "${Protobuf_LITE_LIBRARY_RELEASE}")
#           endif()
#           if(EXISTS "${Protobuf_LITE_LIBRARY_DEBUG}")
#             set_property(TARGET protobuf::libprotobuf-lite APPEND PROPERTY
#               IMPORTED_CONFIGURATIONS DEBUG)
#             set_target_properties(protobuf::libprotobuf-lite PROPERTIES
#               IMPORTED_LOCATION_DEBUG "${Protobuf_LITE_LIBRARY_DEBUG}")
#           endif()
#           if(UNIX AND TARGET Threads::Threads)
#             set_property(TARGET protobuf::libprotobuf-lite APPEND PROPERTY
#                 INTERFACE_LINK_LIBRARIES Threads::Threads)
#           endif()
#       endif()
#   endif()

#   if(Protobuf_PROTOC_LIBRARY)
#       if(NOT TARGET protobuf::libprotoc)
#           add_library(protobuf::libprotoc UNKNOWN IMPORTED)
#           set_target_properties(protobuf::libprotoc PROPERTIES
#             INTERFACE_INCLUDE_DIRECTORIES "${Protobuf_INCLUDE_DIR}")
#           if(EXISTS "${Protobuf_PROTOC_LIBRARY}")
#             set_target_properties(protobuf::libprotoc PROPERTIES
#               IMPORTED_LOCATION "${Protobuf_PROTOC_LIBRARY}")
#           endif()
#           if(EXISTS "${Protobuf_PROTOC_LIBRARY_RELEASE}")
#             set_property(TARGET protobuf::libprotoc APPEND PROPERTY
#               IMPORTED_CONFIGURATIONS RELEASE)
#             set_target_properties(protobuf::libprotoc PROPERTIES
#               IMPORTED_LOCATION_RELEASE "${Protobuf_PROTOC_LIBRARY_RELEASE}")
#           endif()
#           if(EXISTS "${Protobuf_PROTOC_LIBRARY_DEBUG}")
#             set_property(TARGET protobuf::libprotoc APPEND PROPERTY
#               IMPORTED_CONFIGURATIONS DEBUG)
#             set_target_properties(protobuf::libprotoc PROPERTIES
#               IMPORTED_LOCATION_DEBUG "${Protobuf_PROTOC_LIBRARY_DEBUG}")
#           endif()
#           if(UNIX AND TARGET Threads::Threads)
#             set_property(TARGET protobuf::libprotoc APPEND PROPERTY
#                 INTERFACE_LINK_LIBRARIES Threads::Threads)
#           endif()
#       endif()
#   endif()

#   if(Protobuf_PROTOC_EXECUTABLE)
#       if(NOT TARGET protobuf::protoc)
#           add_executable(protobuf::protoc IMPORTED)
#           if(EXISTS "${Protobuf_PROTOC_EXECUTABLE}")
#             set_target_properties(protobuf::protoc PROPERTIES
#               IMPORTED_LOCATION "${Protobuf_PROTOC_EXECUTABLE}")
#           endif()
#       endif()
#   endif()
# endif()

# include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
# FIND_PACKAGE_HANDLE_STANDARD_ARGS(Protobuf
#     REQUIRED_VARS Protobuf_LIBRARIES Protobuf_INCLUDE_DIR
#     VERSION_VAR Protobuf_VERSION
# )

# if(Protobuf_FOUND)
#     set(Protobuf_INCLUDE_DIRS ${Protobuf_INCLUDE_DIR})
# endif()

# # Restore the original find library ordering
# if( Protobuf_USE_STATIC_LIBS )
#   set(CMAKE_FIND_LIBRARY_SUFFIXES ${_protobuf_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES})
# endif()

# # Backwards compatibility
# # Define upper case versions of output variables
# foreach(Camel
#     Protobuf_SRC_ROOT_FOLDER
#     Protobuf_IMPORT_DIRS
#     Protobuf_DEBUG
#     Protobuf_INCLUDE_DIRS
#     Protobuf_LIBRARIES
#     Protobuf_PROTOC_LIBRARIES
#     Protobuf_LITE_LIBRARIES
#     Protobuf_LIBRARY
#     Protobuf_PROTOC_LIBRARY
#     Protobuf_INCLUDE_DIR
#     Protobuf_PROTOC_EXECUTABLE
#     Protobuf_LIBRARY_DEBUG
#     Protobuf_PROTOC_LIBRARY_DEBUG
#     Protobuf_LITE_LIBRARY
#     Protobuf_LITE_LIBRARY_DEBUG
#     )
#     string(TOUPPER ${Camel} UPPER)
#     set(${UPPER} ${${Camel}})
# endforeach()
