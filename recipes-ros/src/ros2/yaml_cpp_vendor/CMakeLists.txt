cmake_minimum_required(VERSION 3.10)
project(yaml_cpp_vendor CXX)

find_package(ament_cmake REQUIRED)
find_package(ament_cmake_vendor_package REQUIRED)

ament_add_default_options()

# NO_CMAKE_PACKAGE_REGISTRY used to avoid finding the library downloaded in WORKSPACE B
# when building workspace A.
# This should only find a system installed yaml-cpp and thus the environment hook isn't needed.
find_package(yaml-cpp 0.8.0 QUIET NO_CMAKE_PACKAGE_REGISTRY)

set(YAML_CPP_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
if(MSVC)
  set(YAML_CPP_CXX_FLAGS "/wd4251 /wd4275 ${YAML_CPP_CXX_FLAGS}")
endif()

ament_vendor(yaml_cpp_vendor
  SATISFIED ${yaml-cpp_FOUND}
  VCS_URL https://github.com/jbeder/yaml-cpp.git
  VCS_VERSION 0.8.0
  GLOBAL_HOOK
  CMAKE_ARGS
    "-DCMAKE_CXX_FLAGS=${YAML_CPP_CXX_FLAGS}"
    -DYAML_CPP_BUILD_CONTRIB:BOOL=OFF
    -DYAML_CPP_BUILD_TESTS:BOOL=OFF
    -DYAML_CPP_BUILD_TOOLS:BOOL=OFF
    -DYAML_BUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
  PATCHES patches
)

ament_package(
  CONFIG_EXTRAS "yaml_cpp_vendor-extras.cmake.in"
)
