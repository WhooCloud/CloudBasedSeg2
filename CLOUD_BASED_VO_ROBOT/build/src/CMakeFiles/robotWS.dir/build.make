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
CMAKE_SOURCE_DIR = /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT/build

# Include any dependencies generated for this target.
include src/CMakeFiles/robotWS.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/robotWS.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/robotWS.dir/flags.make

src/CMakeFiles/robotWS.dir/robotWS.cpp.o: src/CMakeFiles/robotWS.dir/flags.make
src/CMakeFiles/robotWS.dir/robotWS.cpp.o: ../src/robotWS.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/robotWS.dir/robotWS.cpp.o"
	cd /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT/build/src && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/robotWS.dir/robotWS.cpp.o -c /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT/src/robotWS.cpp

src/CMakeFiles/robotWS.dir/robotWS.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/robotWS.dir/robotWS.cpp.i"
	cd /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT/build/src && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT/src/robotWS.cpp > CMakeFiles/robotWS.dir/robotWS.cpp.i

src/CMakeFiles/robotWS.dir/robotWS.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/robotWS.dir/robotWS.cpp.s"
	cd /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT/build/src && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT/src/robotWS.cpp -o CMakeFiles/robotWS.dir/robotWS.cpp.s

src/CMakeFiles/robotWS.dir/robotWS.cpp.o.requires:
.PHONY : src/CMakeFiles/robotWS.dir/robotWS.cpp.o.requires

src/CMakeFiles/robotWS.dir/robotWS.cpp.o.provides: src/CMakeFiles/robotWS.dir/robotWS.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/robotWS.dir/build.make src/CMakeFiles/robotWS.dir/robotWS.cpp.o.provides.build
.PHONY : src/CMakeFiles/robotWS.dir/robotWS.cpp.o.provides

src/CMakeFiles/robotWS.dir/robotWS.cpp.o.provides.build: src/CMakeFiles/robotWS.dir/robotWS.cpp.o

# Object files for target robotWS
robotWS_OBJECTS = \
"CMakeFiles/robotWS.dir/robotWS.cpp.o"

# External object files for target robotWS
robotWS_EXTERNAL_OBJECTS =

../lib/librobotWS.so: src/CMakeFiles/robotWS.dir/robotWS.cpp.o
../lib/librobotWS.so: src/CMakeFiles/robotWS.dir/build.make
../lib/librobotWS.so: src/CMakeFiles/robotWS.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library ../../lib/librobotWS.so"
	cd /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/robotWS.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/robotWS.dir/build: ../lib/librobotWS.so
.PHONY : src/CMakeFiles/robotWS.dir/build

src/CMakeFiles/robotWS.dir/requires: src/CMakeFiles/robotWS.dir/robotWS.cpp.o.requires
.PHONY : src/CMakeFiles/robotWS.dir/requires

src/CMakeFiles/robotWS.dir/clean:
	cd /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT/build/src && $(CMAKE_COMMAND) -P CMakeFiles/robotWS.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/robotWS.dir/clean

src/CMakeFiles/robotWS.dir/depend:
	cd /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT/src /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT/build /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT/build/src /home/yun/git_repo/CloudBasedSeg/CLOUD_BASED_VO_ROBOT/build/src/CMakeFiles/robotWS.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/robotWS.dir/depend

