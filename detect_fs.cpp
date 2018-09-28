#include <iostream>
#include "Filesystem.h"

int main(int argc, char** argv) {
    for (auto p = directory_iterator("."); p != directory_iterator(); ++p)
        std::cout << p->path().string() << '\n';
    return 0;
}
