# Generated by CMake

if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.6)
   message(FATAL_ERROR "CMake >= 2.6.0 required")
endif()
cmake_policy(PUSH)
cmake_policy(VERSION 2.6...3.21)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_targetsDefined)
set(_targetsNotDefined)
set(_expectedTargets)
foreach(_expectedTarget pango_core pango_display pango_geometry pango_glgeometry pango_image pango_opengl pango_packetstream pango_plot pango_python pango_scene pango_tools pango_vars pango_video pango_windowing tinyobj)
  list(APPEND _expectedTargets ${_expectedTarget})
  if(NOT TARGET ${_expectedTarget})
    list(APPEND _targetsNotDefined ${_expectedTarget})
  endif()
  if(TARGET ${_expectedTarget})
    list(APPEND _targetsDefined ${_expectedTarget})
  endif()
endforeach()
if("${_targetsDefined}" STREQUAL "${_expectedTargets}")
  unset(_targetsDefined)
  unset(_targetsNotDefined)
  unset(_expectedTargets)
  set(CMAKE_IMPORT_FILE_VERSION)
  cmake_policy(POP)
  return()
endif()
if(NOT "${_targetsDefined}" STREQUAL "")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_targetsDefined}\nTargets not yet defined: ${_targetsNotDefined}\n")
endif()
unset(_targetsDefined)
unset(_targetsNotDefined)
unset(_expectedTargets)


# Compute the installation prefix relative to this file.
get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
if(_IMPORT_PREFIX STREQUAL "/")
  set(_IMPORT_PREFIX "")
endif()

# Create imported target pango_core
add_library(pango_core SHARED IMPORTED)

set_target_properties(pango_core PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "_OSX_"
  INTERFACE_COMPILE_FEATURES "cxx_decltype_auto"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "Threads::Threads"
)

# Create imported target pango_display
add_library(pango_display SHARED IMPORTED)

set_target_properties(pango_display PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "pango_core;pango_opengl;pango_windowing;pango_vars"
)

# Create imported target pango_geometry
add_library(pango_geometry SHARED IMPORTED)

set_target_properties(pango_geometry PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "HAVE_EIGEN"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "pango_core;pango_image;tinyobj;Eigen3::Eigen"
)

# Create imported target pango_glgeometry
add_library(pango_glgeometry SHARED IMPORTED)

set_target_properties(pango_glgeometry PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "pango_geometry;pango_opengl"
)

# Create imported target pango_image
add_library(pango_image SHARED IMPORTED)

set_target_properties(pango_image PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "pango_core"
)

# Create imported target pango_opengl
add_library(pango_opengl SHARED IMPORTED)

set_target_properties(pango_opengl PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "HAVE_EIGEN;HAVE_GLEW"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "pango_core;pango_image;Eigen3::Eigen;/usr/local/lib/libGLEW.dylib;/Library/Developer/CommandLineTools/SDKs/MacOSX12.1.sdk/System/Library/Frameworks/OpenGL.framework;/Library/Developer/CommandLineTools/SDKs/MacOSX12.1.sdk/System/Library/Frameworks/OpenGL.framework"
)

# Create imported target pango_packetstream
add_library(pango_packetstream SHARED IMPORTED)

set_target_properties(pango_packetstream PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "pango_core"
)

# Create imported target pango_plot
add_library(pango_plot SHARED IMPORTED)

set_target_properties(pango_plot PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "pango_display"
)

# Create imported target pango_python
add_library(pango_python SHARED IMPORTED)

set_target_properties(pango_python PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "HAVE_PYTHON"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "pango_core;pango_display;pango_plot;pango_video;pango_vars"
)

# Create imported target pango_scene
add_library(pango_scene SHARED IMPORTED)

set_target_properties(pango_scene PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "pango_opengl"
)

# Create imported target pango_tools
add_library(pango_tools SHARED IMPORTED)

set_target_properties(pango_tools PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "pango_display;pango_video"
)

# Create imported target pango_vars
add_library(pango_vars SHARED IMPORTED)

set_target_properties(pango_vars PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "pango_core"
)

# Create imported target pango_video
add_library(pango_video SHARED IMPORTED)

set_target_properties(pango_video PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "pango_core;pango_image;pango_packetstream"
)

# Create imported target pango_windowing
add_library(pango_windowing SHARED IMPORTED)

set_target_properties(pango_windowing PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "PANGO_DEFAULT_WIN_URI=\"cocoa\""
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "pango_core;pango_opengl"
)

# Create imported target tinyobj
add_library(tinyobj SHARED IMPORTED)

set_target_properties(tinyobj PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
)

if(CMAKE_VERSION VERSION_LESS 2.8.12)
  message(FATAL_ERROR "This file relies on consumers using CMake 2.8.12 or greater.")
endif()

# Load information for each installed configuration.
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB CONFIG_FILES "${_DIR}/PangolinTargets-*.cmake")
foreach(f ${CONFIG_FILES})
  include(${f})
endforeach()

# Cleanup temporary variables.
set(_IMPORT_PREFIX)

# Loop over all imported files and verify that they actually exist
foreach(target ${_IMPORT_CHECK_TARGETS} )
  foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )
    if(NOT EXISTS "${file}" )
      message(FATAL_ERROR "The imported target \"${target}\" references the file
   \"${file}\"
but this file does not exist.  Possible reasons include:
* The file was deleted, renamed, or moved to another location.
* An install or uninstall procedure did not complete successfully.
* The installation package was faulty and contained
   \"${CMAKE_CURRENT_LIST_FILE}\"
but not all the files it references.
")
    endif()
  endforeach()
  unset(_IMPORT_CHECK_FILES_FOR_${target})
endforeach()
unset(_IMPORT_CHECK_TARGETS)

# This file does not depend on other imported targets which have
# been exported from the same project but in a separate export set.

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
cmake_policy(POP)
