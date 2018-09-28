cmake_minimum_required(VERSION 3.4)
project(PortableCppFS)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
if (MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /std:c++17")
endif (MSVC)

include(${CMAKE_SOURCE_DIR}/detect_fs.cmake)
if (NO_FS_LIB)
    # No special link needed for fs services (usually on MSVC)
else()
    message("Build with std FS library: ${LINK_FS_LIB}")
    link_libraries(${LINK_FS_LIB})
endif()

add_executable(DetectFs "detect_fs.cpp")
