# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/warmup

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/warmup/ll_cases

# Include any dependencies generated for this target.
include CMakeFiles/stu_float_codegen.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/stu_float_codegen.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/stu_float_codegen.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/stu_float_codegen.dir/flags.make

CMakeFiles/stu_float_codegen.dir/stu_cpp/float_codegen.cpp.o: CMakeFiles/stu_float_codegen.dir/flags.make
CMakeFiles/stu_float_codegen.dir/stu_cpp/float_codegen.cpp.o: ../stu_cpp/float_codegen.cpp
CMakeFiles/stu_float_codegen.dir/stu_cpp/float_codegen.cpp.o: CMakeFiles/stu_float_codegen.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/warmup/ll_cases/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/stu_float_codegen.dir/stu_cpp/float_codegen.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/stu_float_codegen.dir/stu_cpp/float_codegen.cpp.o -MF CMakeFiles/stu_float_codegen.dir/stu_cpp/float_codegen.cpp.o.d -o CMakeFiles/stu_float_codegen.dir/stu_cpp/float_codegen.cpp.o -c /home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/warmup/stu_cpp/float_codegen.cpp

CMakeFiles/stu_float_codegen.dir/stu_cpp/float_codegen.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stu_float_codegen.dir/stu_cpp/float_codegen.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/warmup/stu_cpp/float_codegen.cpp > CMakeFiles/stu_float_codegen.dir/stu_cpp/float_codegen.cpp.i

CMakeFiles/stu_float_codegen.dir/stu_cpp/float_codegen.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stu_float_codegen.dir/stu_cpp/float_codegen.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/warmup/stu_cpp/float_codegen.cpp -o CMakeFiles/stu_float_codegen.dir/stu_cpp/float_codegen.cpp.s

# Object files for target stu_float_codegen
stu_float_codegen_OBJECTS = \
"CMakeFiles/stu_float_codegen.dir/stu_cpp/float_codegen.cpp.o"

# External object files for target stu_float_codegen
stu_float_codegen_EXTERNAL_OBJECTS =

stu_float_codegen: CMakeFiles/stu_float_codegen.dir/stu_cpp/float_codegen.cpp.o
stu_float_codegen: CMakeFiles/stu_float_codegen.dir/build.make
stu_float_codegen: CMakeFiles/stu_float_codegen.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/warmup/ll_cases/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable stu_float_codegen"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/stu_float_codegen.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/stu_float_codegen.dir/build: stu_float_codegen
.PHONY : CMakeFiles/stu_float_codegen.dir/build

CMakeFiles/stu_float_codegen.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/stu_float_codegen.dir/cmake_clean.cmake
.PHONY : CMakeFiles/stu_float_codegen.dir/clean

CMakeFiles/stu_float_codegen.dir/depend:
	cd /home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/warmup/ll_cases && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/warmup /home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/warmup /home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/warmup/ll_cases /home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/warmup/ll_cases /home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/warmup/ll_cases/CMakeFiles/stu_float_codegen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/stu_float_codegen.dir/depend

