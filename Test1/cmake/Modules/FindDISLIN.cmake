# Once done this will define
#  DISLIN_FOUND - System has dislin
#  DISLIN_INCLUDE_DIRS - The dislin include directories
#  DISLIN_LIBRARIES - The libraries needed to use dislin
#  DISLIN_DEFINITIONS - Compiler switches required for using dislin
 
if(UNIX)
  find_package(PkgConfig)
  pkg_check_modules(PC_LIBDISLIN QUIET libdislin)
endif(UNIX)

set(DISLIN_DEFINITIONS ${PC_LIBDISLIN_CFLAGS_OTHER})
 
find_path(DISLIN_INCLUDE_DIR dislin.h
          HINTS ${PC_DISLIN_INCLUDEDIR} ${PC_DISLIN_INCLUDE_DIRS} $ENV{DISLIN_INCDIR}
          $ENV{DISLIN}
          PATH_SUFFIXES dislin )

message(status " ${DISLIN_INCLUDE_DIR}")

if(WIN32) 
    if (Fortran_COMPILER_NAME MATCHES "pgfortran.*") # portland
        set (DISNAME "dispgf_d") 
    elseif (Fortran_COMPILER_NAME MATCHES "gfortran.*") # gfortran
        set (DISNAME "disgf_d")
    elseif (Fortran_COMPILER_NAME MATCHES "nagfor.*") # nagfor
        set (DISNAME "")  # not tested
    elseif (Fortran_COMPILER_NAME MATCHES "ifort.*") # intel
        set (DISNAME "disifd")
    endif ()
endif()

find_library(DISLIN_LIBRARY 
             NAMES dislin discpp dislin-10.6 discpp-10.6 ${DISNAME}
             HINTS ${PC_DISLIN_LIBDIR} ${PC_DISLIN_LIBRARY_DIRS} $ENV{DISLIN_LIBDIR} 
             $ENV{DISLIN}
             PATH_SUFFIXES dislin)
message(status ${DISLIN_LIBRARY})
 
set(DISLIN_LIBRARIES ${DISLIN_LIBRARY} )
set(DISLIN_INCLUDE_DIRS ${DISLIN_INCLUDE_DIR} )
 
include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set DISLIN_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(dislin  DEFAULT_MSG
                                  DISLIN_LIBRARY DISLIN_INCLUDE_DIR)
 
mark_as_advanced(DISLIN_INCLUDE_DIR DISLIN_LIBRARY )
