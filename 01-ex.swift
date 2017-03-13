// task 1
func maxNumber1(a: Int, b: Int) -> Int {
  return ((a + b) + abs(a - b)) / 2;
}

print(maxNumber1(a: -3, b: -2)); // -2


// task 2
import Foundation

func sumNumbersFromString(str: String) -> Int {
  let strArr = str.components(separatedBy: " ")

  let numbers = strArr.map { Int($0) ?? 0 }
//  let numbers = strArr.flatMap { Int($0) }
//  let numbers = strArr.map { Int($0) }
//  let numbers = strArr.map { Int($0)!
//  let numbers = strArr.map { Int($0)! ?? 0 }

  return numbers.reduce(0, +)
}

// print(sumNumbersFromString(str: "0 1 2 3dd 4 5 6 7 8 9 10")) // 52
print(sumNumbersFromString(str: "0 1 2 3 4 5 6 7 8 9 10")) // 55
