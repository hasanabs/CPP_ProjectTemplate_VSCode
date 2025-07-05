#include "fun.h"
#include <iostream>

void hi()
{
  std::cout << "Hello from fun.cpp!" << std::endl;
}

void increment(int *i)
{
  (*i)++;
}
