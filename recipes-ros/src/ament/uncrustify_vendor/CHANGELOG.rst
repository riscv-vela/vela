^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Changelog for package uncrustify_vendor
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3.0.0 (2024-04-16)
------------------
* Update to uncrustify 0.78.1 (`#37 <https://github.com/ament/uncrustify_vendor/issues/37>`_)
  * Update to uncrustify 0.78.1
  * Fix the uncrustify version detection logic.
  And make sure we are at least 0.78.
* Contributors: Chris Lalancette

2.2.1 (2023-07-11)
------------------
* Switch to ament_cmake_vendor_package (`#34 <https://github.com/ament/uncrustify_vendor/issues/34>`_)
* Contributors: Scott K Logan

2.2.0 (2023-04-28)
------------------

2.1.2 (2023-02-14)
------------------
* [rolling] Update maintainers - 2022-11-07 (`#31 <https://github.com/ament/uncrustify_vendor/issues/31>`_)
* Contributors: Audrow Nash

2.1.1 (2022-09-13)
------------------
* Mirror rolling to master
* Contributors: Audrow Nash

2.1.0 (2022-04-29)
------------------
* 2.1.0
* Contributors: Audrow Nash

2.0.2 (2022-03-28)
------------------
* Use git hash for uncrustify_vendor (`#30 <https://github.com/ament/uncrustify_vendor/issues/30>`_)
  CMake ExternalProject_add recommends using a specific git hash with
  GIT_TAG because branches and tags can be updated to point to different
  references.
  https://cmake.org/cmake/help/latest/module/ExternalProject.html
* Contributors: Shane Loretz

2.0.1 (2022-03-01)
------------------
* Quiet down build warning on Windows. (`#29 <https://github.com/ament/uncrustify_vendor/issues/29>`_)
  When building on Windows, uncrustify doesn't seem to use the
  CMAKE_BUILD_TYPE variable and thus prints a warning about it.
  Quiet that down with --no-warn-unused-cli.
* Contributors: Chris Lalancette

2.0.0 (2021-12-17)
------------------
* Update to uncrustify 0.72 (`#27 <https://github.com/ament/uncrustify_vendor/issues/27>`_)
  * Update to uncrustify 0.72
* Update maintainers to Audrow Nash (`#25 <https://github.com/ament/uncrustify_vendor/issues/25>`_)
* Contributors: Audrow Nash, Chris Lalancette

1.5.3 (2021-03-18)
------------------
* Add an override flag to force vendored build (`#23 <https://github.com/ament/uncrustify_vendor/issues/23>`_)
* Contributors: Scott K Logan

1.5.2 (2021-02-01 14:42)
------------------------
* Revert "Add git checkout before patching."
  This reverts commit c61408170a84ed6bc31e641fc8a2467ca5830884.
  This is no longer necessary because of UDPATE_DISCONNECTED, which will
  make the download step act more like using a URL instead of a
  GIT_REPOSITORY.
* Make git upstream act more like tar (`#22 <https://github.com/ament/uncrustify_vendor/issues/22>`_)
  Some of our problems with using GIT_REPOSITORY with a GIT_TAG stem from
  CMake trying to "update" the repository each time the target is
  evaluated. This would be important if not for the fact that we're
  targeting a specific REF, so the repository will never be out-of-date
  unless we change the ref, which would invalidate the target anyway.
  We can safely use UPDATE_DISCONNECTED to block the update step from
  invalidating the source target, which should prevent downstream targets
  like patch, build, and install from being re-triggered unnecessarily.
  The one caveat to this is that a change to GIT_TAG doesn't invalidate
  the target like a change to GIT_REPOSITORY or URL would. To work around
  this, I updated the target name to contain the ref instead of the
  supposed version number, which will then force a new build if we change
  the ref in the future. This is also more correct, since it would be easy
  for the ref and target name to get out of sync.
* Revert "Use explicit INSTALL_COMMAND to suppress DESTDIR"
  This reverts commit ca32b1eb8f77b982be9d82fc186bd7d98ce2c45a.
  Evidently this wasn't working correctly on Windows.
* Contributors: Scott K Logan

1.5.1 (2021-02-01 11:26)
------------------------
* Use explicit INSTALL_COMMAND to suppress DESTDIR (`#21 <https://github.com/ament/uncrustify_vendor/issues/21>`_)
  The DESTDIR environment variable is used on UNIX systems during an
  invocation of 'make install' to specify an alternate directory prefix
  for installation paths. Since this isn't a cross-platform mechanism,
  the CMAKE_INSTALL_PREFIX CMake variable can also be used.
  Unfortunately, if both of these are specified, they will both be
  applied. This isn't typically a problem, but can cause problems for the
  installation phase of ExternalProject_Add if the external project is
  built during an invocation of 'make install' with DESTDIR set.
  Since the CMAKE_INSTALL_PREFIX method is employed by the call to
  ExternalProject_Add instead of DESTDIR, we should specifically suppress
  DESTDIR if it is set so that it doesn't interfere with the installation
  of the external project to the staging directory.
* Add git checkout before patching. (`#20 <https://github.com/ament/uncrustify_vendor/issues/20>`_)
  This ensures that on subsequent runs, if the patch step is run
  again it will successfully repatch.
* Contributors: Chris Lalancette, Scott K Logan

1.5.0 (2021-01-25)
------------------
* Declare missing dependency on 'git' (`#18 <https://github.com/ament/uncrustify_vendor/issues/18>`_)
  Follow-up to f0c78e9e47516589eb2945569031d001341abb90
* Use Git to fetch upstream uncrustify source code (`#16 <https://github.com/ament/uncrustify_vendor/issues/16>`_)
  This is somewhat of a lateral move in general, but the patching solution
  implemented in ec709bb8838f193dc1c90ccf95ecc1e28ba6bd08 can fail under
  certain circumstances if the target directory is not a git repository.
  Since the patching solution requires git anyway, and we're downloading
  what should be the exact same files, there should be no reason that this
  wouldn't work in largely the same way the current tarball-based solution
  does.
* Switch to applying patch with git apply. (`#15 <https://github.com/ament/uncrustify_vendor/issues/15>`_)
  This gets us closer to being able to build without Administrator
  on Windows, since the "patch" command required Administrator.
* Update package maintainers. (`#12 <https://github.com/ament/uncrustify_vendor/issues/12>`_)
* Contributors: Chris Lalancette, Michel Hidalgo, Scott K Logan

1.4.0 (2020-04-10)
------------------
* Switch to CMake Patch package (`#7 <https://github.com/ament/uncrustify_vendor/issues/7>`_)
  As of CMake 3.10, there is a `FindPatch.cmake` module built in.
  Note that, on Windows, this prefers `patch` distributed with Git instead of via the "GNU Patch for Windows" Chocolatey package, so UAC is not required to build this package anymore.
* Contributors: Dan Rose

1.3.0 (2019-09-17)
------------------
* Update uncrustify version to fix warnings on armhf (`#5 <https://github.com/ament/uncrustify_vendor/issues/5>`_)
  * Patch md5 algorithm in uncrustify source to fix warnings on armhf
  * Update to latest uncrustify instead of cherry picking patch
* Contributors: Emerson Knapp

1.2.0 (2019-04-11)
------------------
* Merge pull request `#4 <https://github.com/ament/uncrustify_vendor/issues/4>`_ from ament/update-maintainer
  Update package maintainer.
* Update package maintainer.
* Contributors: Steven! Ragnarök

1.1.0 (2019-01-11)
------------------
* Update to Uncrustify v0.68.1 (`#3 <https://github.com/ament/uncrustify_vendor/issues/3>`_)
* Contributors: Jacob Perron

1.0.0 (2018-07-11)
------------------
* create an actual uncrustify_vendor package and build only is the vers… (`#1 <https://github.com/ament/uncrustify_vendor/issues/1>`_)
  * create an actual uncrustify_vendor package and build only is the version on the path is lower than 0.66.1
  * patch install rules
  * add extra install rule for runtime target on macos
  * add cross-compilation and android support
  * make 0.67 the minimum required version
  * use source permission for executable bit to be set on Mac and Bionic
* Initial commit
* Contributors: Mikael Arguedas
