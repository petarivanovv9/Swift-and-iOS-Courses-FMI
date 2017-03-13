func maxNumber1(a: Int, b: Int) -> Int {
  return ((a + b) + abs(a - b)) / 2;
}

print(maxNumber1(a: -3, b: -2)); // -2
