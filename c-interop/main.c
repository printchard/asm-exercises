#include <stdio.h>

extern unsigned int add_ints(unsigned int a, unsigned int b);

int main() {
  unsigned int res = add_ints(2, 3);

  printf("%d\n", res);
  return 0;
}
