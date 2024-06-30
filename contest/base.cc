#include <bits/stdc++.h>

#ifdef DEBUG
#include "debug.cc"
#else
#define debug(...) ""
#endif

#define print_cont(arr)                                                        \
  for (size_t i = 0; i < arr.size(); i++)                                      \
    std::cout << arr[i] << ' ';                                                \
  std::cout << std::endl

#define print_cont_reverse(arr)                                                \
  for (size_t i = arr.size() - 1; i >= 0; i--)                                 \
    std::cout << arr[i] << ' ';                                                \
  std::cout << std::endl

using i = int;
using ll = long long;
using s = std::string;
using vi = std::vector<i>;
using vll = std::vector<ll>;
using vs = std::vector<s>;

void read_array(size_t size, std::vector<long long> &arr) {
  for (size_t i = 0; i < size; i++) {
    std::cin >> arr[i];
  }
}

void read_array(size_t size, long long *arr[]) {
  for (size_t i = 0; i < size; i++) {
    std::cin >> *arr[i];
  }
}

void solve(int test_num)
{
  
}

int main() {
  int test_num;
  std::cin >> test_num;
  for (int i = 1; i <= test_num; i++) {
    solve(i);
  }

  return EXIT_SUCCESS;
}
