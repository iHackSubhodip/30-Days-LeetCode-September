/*
 Question - Repeated Substring Pattern
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/554/week-1-september-1st-september-7th/3447/
 */

class Solution {
  func repeatedSubstringPattern(_ s: String) -> Bool {
    var newStr = s + s
    // print(newStr)
    newStr.removeLast()
    // print(newStr)
    newStr.removeFirst()
    // print(newStr)
    return newStr.contains(s) ? true : false
  }
}
