# - Find expat
# Find the native EXPAT headers and libraries.
#
#  EXPAT_INCLUDE_DIRS - where to find expat.h, etc.
#  EXPAT_LIBRARIES    - List of libraries when using expat.
#  EXPAT_FOUND        - True if expat found.

#=============================================================================
# Copyright 2006-2009 Kitware, Inc.
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distributed this file outside of CMake, substitute the full
#  License text for the above reference.)

# Look for the header file.
SET(EXPAT_INCLUDE_DIR "___EXPAT_/include")
SET(EXPAT_INCLUDE_DIRS "___EXPAT_/include")
SET(EXPAT_LIBRARY "___EXPAT_/lib")
FIND_PATH("___EXPAT_/include" NAMES expat.h)

# Look for the library.
FIND_LIBRARY("___EXPAT_/lib" NAMES expat libexpat)

# handle the QUIETLY and REQUIRED arguments and set EXPAT_FOUND to TRUE if 
# all listed variables are TRUE
SET(EXPAT_LIBRARIES "-L___EXPAT_/lib -Wl,-rpath -Wl,___EXPAT_/lib -lexpat")
SET(EXPAT_INCLUDE_DIRS "___EXPAT_/include") 
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(EXPAT DEFAULT_MSG EXPAT_LIBRARY EXPAT_INCLUDE_DIR)



MARK_AS_ADVANCED(EXPAT_INCLUDE_DIR EXPAT_LIBRARY)
