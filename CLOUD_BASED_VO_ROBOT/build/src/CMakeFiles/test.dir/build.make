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
include src/CMakeFiles/test.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/test.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/test.dir/flags.make

src/CMakeFiles/test.dir/test.cpp.o: src/CMakeFiles/test.dir/flags.make
src/CMakeFiles/test.dir/test.cpp.o: ../src/test.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/test.dir/test.cpp.o"
	cd /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/src && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test.dir/test.cpp.o -c /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/src/test.cpp

src/CMakeFiles/test.dir/test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test.dir/test.cpp.i"
	cd /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/src && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/src/test.cpp > CMakeFiles/test.dir/test.cpp.i

src/CMakeFiles/test.dir/test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test.dir/test.cpp.s"
	cd /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/src && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/src/test.cpp -o CMakeFiles/test.dir/test.cpp.s

src/CMakeFiles/test.dir/test.cpp.o.requires:
.PHONY : src/CMakeFiles/test.dir/test.cpp.o.requires

src/CMakeFiles/test.dir/test.cpp.o.provides: src/CMakeFiles/test.dir/test.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/test.dir/build.make src/CMakeFiles/test.dir/test.cpp.o.provides.build
.PHONY : src/CMakeFiles/test.dir/test.cpp.o.provides

src/CMakeFiles/test.dir/test.cpp.o.provides.build: src/CMakeFiles/test.dir/test.cpp.o

# Object files for target test
test_OBJECTS = \
"CMakeFiles/test.dir/test.cpp.o"

# External object files for target test
test_EXTERNAL_OBJECTS =

../bin/test: src/CMakeFiles/test.dir/test.cpp.o
../bin/test: src/CMakeFiles/test.dir/build.make
../bin/test: src/CMakeFiles/test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/test"
	cd /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/test.dir/build: ../bin/test
.PHONY : src/CMakeFiles/test.dir/build

src/CMakeFiles/test.dir/requires: src/CMakeFiles/test.dir/test.cpp.o.requires
.PHONY : src/CMakeFiles/test.dir/requires

src/CMakeFiles/test.dir/clean:
	cd /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/src && $(CMAKE_COMMAND) -P CMakeFiles/test.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/test.dir/clean

src/CMakeFiles/test.dir/depend:
	cd /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/src /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/src /home/yun/git_repo/CloudBasedSeg2/CLOUD_BASED_VO_ROBOT/build/src/CMakeFiles/test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/test.dir/depend

