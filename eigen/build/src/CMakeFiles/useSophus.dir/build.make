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
CMAKE_SOURCE_DIR = /home/yun/Code/SLAM/eigen

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yun/Code/SLAM/eigen/build

# Include any dependencies generated for this target.
include src/CMakeFiles/useSophus.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/useSophus.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/useSophus.dir/flags.make

src/CMakeFiles/useSophus.dir/useSophus.cpp.o: src/CMakeFiles/useSophus.dir/flags.make
src/CMakeFiles/useSophus.dir/useSophus.cpp.o: ../src/useSophus.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/yun/Code/SLAM/eigen/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/useSophus.dir/useSophus.cpp.o"
	cd /home/yun/Code/SLAM/eigen/build/src && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/useSophus.dir/useSophus.cpp.o -c /home/yun/Code/SLAM/eigen/src/useSophus.cpp

src/CMakeFiles/useSophus.dir/useSophus.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/useSophus.dir/useSophus.cpp.i"
	cd /home/yun/Code/SLAM/eigen/build/src && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/yun/Code/SLAM/eigen/src/useSophus.cpp > CMakeFiles/useSophus.dir/useSophus.cpp.i

src/CMakeFiles/useSophus.dir/useSophus.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/useSophus.dir/useSophus.cpp.s"
	cd /home/yun/Code/SLAM/eigen/build/src && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/yun/Code/SLAM/eigen/src/useSophus.cpp -o CMakeFiles/useSophus.dir/useSophus.cpp.s

src/CMakeFiles/useSophus.dir/useSophus.cpp.o.requires:
.PHONY : src/CMakeFiles/useSophus.dir/useSophus.cpp.o.requires

src/CMakeFiles/useSophus.dir/useSophus.cpp.o.provides: src/CMakeFiles/useSophus.dir/useSophus.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/useSophus.dir/build.make src/CMakeFiles/useSophus.dir/useSophus.cpp.o.provides.build
.PHONY : src/CMakeFiles/useSophus.dir/useSophus.cpp.o.provides

src/CMakeFiles/useSophus.dir/useSophus.cpp.o.provides.build: src/CMakeFiles/useSophus.dir/useSophus.cpp.o

# Object files for target useSophus
useSophus_OBJECTS = \
"CMakeFiles/useSophus.dir/useSophus.cpp.o"

# External object files for target useSophus
useSophus_EXTERNAL_OBJECTS =

../bin/useSophus: src/CMakeFiles/useSophus.dir/useSophus.cpp.o
../bin/useSophus: src/CMakeFiles/useSophus.dir/build.make
../bin/useSophus: /home/yun/Code/SLAM/Sophus/libSophus.so
../bin/useSophus: src/CMakeFiles/useSophus.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/useSophus"
	cd /home/yun/Code/SLAM/eigen/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/useSophus.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/useSophus.dir/build: ../bin/useSophus
.PHONY : src/CMakeFiles/useSophus.dir/build

src/CMakeFiles/useSophus.dir/requires: src/CMakeFiles/useSophus.dir/useSophus.cpp.o.requires
.PHONY : src/CMakeFiles/useSophus.dir/requires

src/CMakeFiles/useSophus.dir/clean:
	cd /home/yun/Code/SLAM/eigen/build/src && $(CMAKE_COMMAND) -P CMakeFiles/useSophus.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/useSophus.dir/clean

src/CMakeFiles/useSophus.dir/depend:
	cd /home/yun/Code/SLAM/eigen/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yun/Code/SLAM/eigen /home/yun/Code/SLAM/eigen/src /home/yun/Code/SLAM/eigen/build /home/yun/Code/SLAM/eigen/build/src /home/yun/Code/SLAM/eigen/build/src/CMakeFiles/useSophus.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/useSophus.dir/depend

