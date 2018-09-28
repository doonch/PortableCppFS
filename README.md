# PortableCppFS
Auto detect the necessary compile-time and link-time flags for using the C++17 feature std::filesystem.

It can be a pain to use `std::filesystem`, as different systems require difference include statements, and also different link flags.
This project uses a combination of the C++17 feature `__has_include`, and the CMake feature `try_compile`, to detect the correct combination.


