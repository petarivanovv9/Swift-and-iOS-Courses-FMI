func generatePermutations(str: String) -> [String] {
  if str.characters.count <= 1 {
    return [str]
  }
  // creating an empty array of a certain type using initializer syntax
  // var permSet = Set([String]())
  var allPerms = [String]()
  let strArr = Array(str.characters)
  for (index, c) in strArr.enumerated() {
    var newStrArr = strArr
    newStrArr.remove(at: index)
    let newStr = newStrArr.map { String($0) }.joined(separator:"")
    let temporaryPerms = generatePermutations(str: newStr)
    for elem in temporaryPerms {
      // let newElem = String(c) + elem
      // if permSet.contains(newElem) == false {
        allPerms.append(String(c) + elem)
      // }
    }
  }
  return allPerms
}

print(generatePermutations(str: "ABC")) // .count  -> 6  = 3!
// print(generatePermutations(str: "ABCC")) // .count -> 24 = 4!
