#----------------------------------------------------------------
# Generated CMake target import file for configuration "Gentoo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "double-conversion" for configuration "Gentoo"
set_property(TARGET double-conversion APPEND PROPERTY IMPORTED_CONFIGURATIONS GENTOO)
set_target_properties(double-conversion PROPERTIES
  IMPORTED_LOCATION_GENTOO "${_IMPORT_PREFIX}/lib64/libdouble-conversion.so.1.0.0"
  IMPORTED_SONAME_GENTOO "libdouble-conversion.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS double-conversion )
list(APPEND _IMPORT_CHECK_FILES_FOR_double-conversion "${_IMPORT_PREFIX}/lib64/libdouble-conversion.so.1.0.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
