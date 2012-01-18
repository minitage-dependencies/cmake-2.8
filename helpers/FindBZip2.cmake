# - Try to find BZip2
# Once done this will define
#
#  BZIP2_FOUND - system has BZip2
#  BZIP2_INCLUDE_DIR - the BZip2 include directory
#  BZIP2_LIBRARIES - Link these to use BZip2
#  BZIP2_NEED_PREFIX - this is set if the functions are prefixed with BZ2_

#=============================================================================
# Copyright 2006-2009 Kitware, Inc.
# Copyright 2006 Alexander Neundorf <neundorf@kde.org>
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)


# Look for the header file.
SET(BZIP2_INCLUDE_DIR "___BZIP2_/include")
SET(BZIP2_INCLUDE_DIRS "___BZIP2_/include")
SET(BZIP2_LIBRARY "___BZIP2_/lib")
FIND_PATH("___BZIP2_/include" NAMES bzlib.h)

# Look for the library.
FIND_LIBRARY("___BZIP2_/lib" NAMES bz2 libbz2) 

# handle the QUIETLY and REQUIRED arguments and set BZip2_FOUND to TRUE if 
# all listed variables are TRUE
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(BZIP2 DEFAULT_MSG BZIP2_LIBRARY BZIP2_INCLUDE_DIR)
Set(BZip2_FOUND $BZIP2_FOUND})

IF(BZip2_FOUND)
  SET(BZIP2_LIBRARIES "-L___BZIP2_/lib -Wl,-rpath -Wl,___BZIP2_/lib")
  SET(BZIP2_INCLUDE_DIRS "___BZIP2_/include")
ELSE(BZip2_FOUND)
  SET(BZIP2_LIBRARIES)
  SET(BZIP2_INCLUDE_DIRS)
ENDIF(BZip2_FOUND) 

MARK_AS_ADVANCED(BZIP2_INCLUDE_DIR BZIP2_LIBRARIES)

