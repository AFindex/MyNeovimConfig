#include <algorithm>
#include <iostream>

void test();

int main() {
  std::cout << "hell world from nvim lsp" << std::endl;

  for (int i = 0; i < 10; i++) {
    std::cout << i << std::endl;
    for (int i = 0; i < 10; i++) {
      test();
    }
  }
  return 0;
}
void test() {
  std::cout << "test" << std::endl;
  std::cout << "test" << std::endl;
  std::cout << "test" << std::endl;
  std::cout << "test" << std::endl;
}

// two number add function
