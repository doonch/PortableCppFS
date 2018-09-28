#pragma once

#if __has_include(<filesystem>)               // This will happen on Ubuntu g++-8/clang++-5, MSVC 15.7.6, Mac clang++-6/7
#include <filesystem>
using std::filesystem::path;
using std::filesystem::directory_iterator;
#pragma message ("Using std::filesystem")
#else
#if __has_include(<experimental/filesystem>)  // This will happen on Ubuntu/g++-7, Mac/g++-8
#include <experimental/filesystem>
using std::experimental::filesystem::path;
using std::experimental::filesystem::directory_iterator;
#pragma message ("Using experimental::filesystem")
#else
#if __has_include(<boost/filesystem.hpp>)     // This will happen e.g. on Mac with Apple-clang++-9
#include <boost/filesystem.hpp>
using boost::filesystem::path;
using boost::filesystem::directory_iterator;
#pragma message ("Using boost::filesystem")
#else
#define NO_FILESYSTEM_FOUND
#error ("Could not find any filesystem header")
#endif
#endif
#endif
