#----------------------------------------------------------------
# Generated CMake target import file for configuration "Gentoo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "glfw" for configuration "Gentoo"
set_property(TARGET glfw APPEND PROPERTY IMPORTED_CONFIGURATIONS GENTOO)
set_target_properties(glfw PROPERTIES
  IMPORTED_LOCATION_GENTOO "${_IMPORT_PREFIX}/lib64/libglfw.so.3.2"
  IMPORTED_SONAME_GENTOO "libglfw.so.3"
  )

list(APPEND _IMPORT_CHECK_TARGETS glfw )
list(APPEND _IMPORT_CHECK_FILES_FOR_glfw "${_IMPORT_PREFIX}/lib64/libglfw.so.3.2" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
