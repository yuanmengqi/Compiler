#include "logging.hpp"
int main() {
    LOG(DEBUG) << "This is DEBUG log item.";
    LOG(INFO) << "This is INFO log item";
    LOG(WARNING) << "This is WARNING log item";
    LOG(ERROR) << "This is ERROR log item";

    return 0;
}