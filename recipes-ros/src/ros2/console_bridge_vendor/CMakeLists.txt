cmake_minimum_required(VERSION 3.13)
project(console_bridge_vendor)

if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(ament_cmake_vendor_package REQUIRED)

find_package(console_bridge 1.0.1 QUIET)

ament_vendor(console_bridge_vendor
  SATISFIED ${console_bridge_FOUND}
  VCS_URL https://github.com/ros/console_bridge.git
  VCS_VERSION 0828d846f2d4940b4e2b5075c6c724991d0cd308
  GLOBAL_HOOK
)

# TODO(blast545): This section and package.xml should be updated once copyright auto is solved.
# See: https://github.com/ament/ament_lint/issues/237
if(BUILD_TESTING)
  if(TARGET console_bridge_vendor)
    include(GNUInstallDirs)
    add_library(console_bridge_library INTERFACE)
    externalproject_get_property(console_bridge_vendor INSTALL_DIR)
    target_include_directories(console_bridge_library INTERFACE "${INSTALL_DIR}/${CMAKE_INSTALL_INCLUDEDIR}")
    target_link_directories(console_bridge_library INTERFACE "${INSTALL_DIR}/${CMAKE_INSTALL_LIBDIR}")
    target_link_libraries(console_bridge_library INTERFACE ${CMAKE_LINK_LIBRARY_FLAG}console_bridge)
    add_dependencies(console_bridge_library console_bridge_vendor)
  else()
    add_library(console_bridge_library ALIAS console_bridge::console_bridge)
  endif()

  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()

  find_package(performance_test_fixture REQUIRED)
  # Give cppcheck hints about macro definitions coming from outside this package
  get_target_property(ament_cmake_cppcheck_ADDITIONAL_INCLUDE_DIRS
    performance_test_fixture::performance_test_fixture INTERFACE_INCLUDE_DIRECTORIES)

  add_performance_test(benchmark_log test/benchmark/benchmark_log.cpp)
  if(TARGET benchmark_log)
    target_link_libraries(benchmark_log console_bridge_library)
  endif()
endif()

ament_package()
