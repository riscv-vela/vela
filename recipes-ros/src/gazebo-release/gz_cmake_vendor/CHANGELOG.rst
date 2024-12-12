^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Changelog for package gz_cmake_vendor
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

0.0.8 (2024-05-03)
------------------
* Update vendored version to 3.5.3
* Contributors: Addisu Z. Taddese

0.0.7 (2024-04-25)
------------------
* Use an alias target for root library
* Contributors: Addisu Z. Taddese

0.0.6 (2024-04-10)
------------------
* Add support for the `<pkg>::<pkg>` and `<pkg>::all` targets, fix sourcing of dsv files
* Contributors: Addisu Z. Taddese

0.0.5 (2024-04-08)
------------------
* Update vendored version to 3.5.2
* Contributors: Addisu Z. Taddese

0.0.4 (2024-03-29)
------------------
* Update vendored package version
* Contributors: Addisu Z. Taddese

0.0.3 (2024-03-28)
------------------
* Patch the pkg-config directory in the gz-cmake code. (`#4 <https://github.com/gazebo-release/gz_cmake_vendor/issues/4>`_)
  * Patch the pkg-config directory in the gz-cmake code.
  When building on the ROS 2 buildfarm, we aren't setting
  some of the CMAKE_PREFIX variables.  This means that
  using CMAKE_INSTALL_FULL_LIBDIR actually creates a path
  like /opt/ros/rolling/... , which makes debuild upset.
  However, we actually need the FULL_LIBDIR in order to
  calculate the relative path between it and the INSTALL_PREFIX.
  Work around this by having two variables; the
  pkgconfig_install_dir (relative), used to install the files,
  and pkgconfig_abs_install_dir (absolute), used to calculate
  the relative path between them.
  This should fix the build on the buildfarm.  I'll note that
  we are doing it here and not in gz-cmake proper because of
  knock-on effects to downstream gazebo.  If this is successful
  we may end up merging it there, at which point we can drop
  this patch.
  * Update GzPackage as well.
  ---------
* Contributors: Chris Lalancette

0.0.2 (2024-03-27)
------------------
* Require calling find_package on the underlying package (`#3 <https://github.com/gazebo-release/gz_cmake_vendor/issues/3>`_)
  This also changes the version of the vendor package to 0.0.1
  and adds the version of the vendored package in the description
* Fix linter (`#2 <https://github.com/gazebo-release/gz_cmake_vendor/issues/2>`_)
* Use `<depend>` on upstream package so that dependency is exported
* Update maintainer
* Add package.xml and CMakeLists (`#1 <https://github.com/gazebo-release/gz_cmake_vendor/issues/1>`_)
* Initial import
* Contributors: Addisu Z. Taddese
