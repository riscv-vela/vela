cmake_minimum_required(VERSION 3.10)
project(uncrustify_vendor)

find_package(ament_cmake REQUIRED)
find_package(ament_cmake_vendor_package REQUIRED)

function(check_uncrustify RESULT PROGRAM)
  execute_process(
    COMMAND ${PROGRAM} --version
    RESULT_VARIABLE res
    OUTPUT_VARIABLE out
    ERROR_QUIET
    OUTPUT_STRIP_TRAILING_WHITESPACE)
  if(NOT res EQUAL 0)
    set(${RESULT} FALSE PARENT_SCOPE)
  else()
    # Before 0.65 uncrustify used a different versioning scheme so the regex won't match
    string(REGEX REPLACE "^Uncrustify(_d|)-(.*)_f$" "\\2" version_prefix_match "${out}")
    if(NOT version_prefix_match OR version_prefix_match VERSION_LESS 0.78)
      set(${RESULT} FALSE PARENT_SCOPE)
    endif()
  endif()
endfunction()

find_program(UNCRUSTIFY uncrustify)
if(UNCRUSTIFY)
  # TODO: Switch to VALIDATOR in CMake 3.25
  check_uncrustify(UNCRUSTIFY ${UNCRUSTIFY})
endif()

ament_vendor(uncrustify_vendor
  SATISFIED ${UNCRUSTIFY}
  VCS_URL https://github.com/uncrustify/uncrustify.git
  VCS_VERSION uncrustify-0.78.1
  PATCHES patches
  CMAKE_ARGS
    -DNoGitVersionString=ON
)

ament_package()
