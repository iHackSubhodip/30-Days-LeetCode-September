/*
 Question - Find the Difference
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/557/week-4-september-22nd-september-28th/3471/
 */

class Solution {
  func findTheDifference(_ s: String, _ t: String) -> Character {
    if t.count > 0 && s.isEmpty{
      return t.first!
    }
    guard !s.isEmpty && !t.isEmpty else { return " "}
    var mappedSArray = s.map{($0, 1)}
    var mappedTArray = t.map{($0, 1)}
    var sDict = Dictionary(mappedSArray, uniquingKeysWith: +)
    var tDict = Dictionary(mappedTArray, uniquingKeysWith: +)
    
    for (key, value) in tDict{
      if sDict[key] != tDict[key] || sDict[key] == nil{
        return key
      }
    }
    return " "
  }
}
