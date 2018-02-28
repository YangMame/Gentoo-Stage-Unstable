# - Config file for the double-conversion package
# It defines the following variables
# double-conversion_INCLUDE_DIRS
# double-conversion_LIBRARIES

get_filename_component(double-conversion_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)

if(EXISTS "${double-conversion_CMAKE_DIR}/CMakeCache.txt")
  include("${double-conversion_CMAKE_DIR}/double-conversionBuildTreeSettings.cmake")
else()
  set(double-conversion_INCLUDE_DIRS "/usr/include/double-conversion")
endif()

include("/usr/lib64/cmake/double-conversion/double-conversionLibraryDepends.cmake")

set(double-conversion_LIBRARIES double-conversion)
