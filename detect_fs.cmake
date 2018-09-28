# The following section detects which std library provides filesystem services
#
# As of September 2018:
# libstdc++fs:          is used by g++-8, g++-7; clang++ on Ubuntu
# c++fs:                is used by Homebrew clang++-7 on Mac
# libc++experimental:   is used by Homebrew clang++-6 on Mac
# libboost_filesystem:  may be used by Apple clang++ on Mac
# (no lib):             is used by Microsoft Visual C++ (>=15.8)
#

try_compile(NO_FS_LIB
        "${CMAKE_SOURCE_DIR}/${CMAKE_BUILD_TYPE}_test_nofs"
        "${CMAKE_SOURCE_DIR}/detect_fs.cpp")
if (NO_FS_LIB)
    message("Build with no special FS library")
else()
    foreach(STDFSLIB_NAME stdc++fs c++fs c++experimental "boost_system;boost_filesystem")
        try_compile(FOUND_FSLIB
                "${CMAKE_SOURCE_DIR}/${CMAKE_BUILD_TYPE}_test_stdfs"
                "${CMAKE_SOURCE_DIR}/detect_fs.cpp"
                LINK_LIBRARIES ${STDFSLIB_NAME})
        if (FOUND_FSLIB)
            set(LINK_FS_LIB ${STDFSLIB_NAME})
        endif()
    endforeach()
    if(NOT LINK_FS_LIB)
        message(FATAL_ERROR "Could not find any filesystem library. Install Boost, or use a better compiler like g++-7, clang++-5 or Visual Studio 2017")
    endif()
endif()
