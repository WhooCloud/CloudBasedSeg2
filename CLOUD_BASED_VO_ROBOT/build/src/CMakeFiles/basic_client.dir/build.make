# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build

# Include any dependencies generated for this target.
include src/CMakeFiles/basic_client.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/basic_client.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/basic_client.dir/flags.make

src/CMakeFiles/basic_client.dir/basic_client.cpp.o: src/CMakeFiles/basic_client.dir/flags.make
src/CMakeFiles/basic_client.dir/basic_client.cpp.o: ../src/basic_client.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/basic_client.dir/basic_client.cpp.o"
	cd /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/src && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/basic_client.dir/basic_client.cpp.o -c /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/src/basic_client.cpp

src/CMakeFiles/basic_client.dir/basic_client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/basic_client.dir/basic_client.cpp.i"
	cd /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/src && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/src/basic_client.cpp > CMakeFiles/basic_client.dir/basic_client.cpp.i

src/CMakeFiles/basic_client.dir/basic_client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/basic_client.dir/basic_client.cpp.s"
	cd /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/src && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/src/basic_client.cpp -o CMakeFiles/basic_client.dir/basic_client.cpp.s

src/CMakeFiles/basic_client.dir/basic_client.cpp.o.requires:
.PHONY : src/CMakeFiles/basic_client.dir/basic_client.cpp.o.requires

src/CMakeFiles/basic_client.dir/basic_client.cpp.o.provides: src/CMakeFiles/basic_client.dir/basic_client.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/basic_client.dir/build.make src/CMakeFiles/basic_client.dir/basic_client.cpp.o.provides.build
.PHONY : src/CMakeFiles/basic_client.dir/basic_client.cpp.o.provides

src/CMakeFiles/basic_client.dir/basic_client.cpp.o.provides.build: src/CMakeFiles/basic_client.dir/basic_client.cpp.o

# Object files for target basic_client
basic_client_OBJECTS = \
"CMakeFiles/basic_client.dir/basic_client.cpp.o"

# External object files for target basic_client
basic_client_EXTERNAL_OBJECTS =

../bin/basic_client: src/CMakeFiles/basic_client.dir/basic_client.cpp.o
../bin/basic_client: src/CMakeFiles/basic_client.dir/build.make
../bin/basic_client: ../lib/librobotJson.so
../bin/basic_client: ../lib/librobotWS.so
../bin/basic_client: ../lib/librobot_.so
../bin/basic_client: /usr/local/lib/libopencv_videostab.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_video.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_ts.a
../bin/basic_client: /usr/local/lib/libopencv_superres.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_stitching.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_photo.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_ocl.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_objdetect.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_nonfree.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_ml.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_legacy.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_imgproc.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_highgui.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_gpu.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_flann.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_features2d.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_core.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_contrib.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_calib3d.so.2.4.13
../bin/basic_client: /usr/lib/x86_64-linux-gnu/libGLU.so
../bin/basic_client: /usr/lib/x86_64-linux-gnu/libGL.so
../bin/basic_client: /usr/lib/x86_64-linux-gnu/libSM.so
../bin/basic_client: /usr/lib/x86_64-linux-gnu/libICE.so
../bin/basic_client: /usr/lib/x86_64-linux-gnu/libX11.so
../bin/basic_client: /usr/lib/x86_64-linux-gnu/libXext.so
../bin/basic_client: /usr/local/lib/libopencv_nonfree.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_ocl.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_gpu.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_photo.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_objdetect.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_legacy.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_video.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_ml.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_calib3d.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_features2d.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_highgui.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_imgproc.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_flann.so.2.4.13
../bin/basic_client: /usr/local/lib/libopencv_core.so.2.4.13
../bin/basic_client: src/CMakeFiles/basic_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/basic_client"
	cd /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/basic_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/basic_client.dir/build: ../bin/basic_client
.PHONY : src/CMakeFiles/basic_client.dir/build

src/CMakeFiles/basic_client.dir/requires: src/CMakeFiles/basic_client.dir/basic_client.cpp.o.requires
.PHONY : src/CMakeFiles/basic_client.dir/requires

src/CMakeFiles/basic_client.dir/clean:
	cd /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/src && $(CMAKE_COMMAND) -P CMakeFiles/basic_client.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/basic_client.dir/clean

src/CMakeFiles/basic_client.dir/depend:
	cd /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/src /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/src /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/src/CMakeFiles/basic_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/basic_client.dir/depend

