/*
 Question - Compare Version Numbers
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/555/week-2-september-8th-september-14th/3454/
 */

class Solution {
  func compareVersion(_ version1: String, _ version2: String) -> Int {
    let arr1 = version1.split(separator: ".").map { Int($0)! }
    let arr2 = version2.split(separator: ".").map { Int($0)! }
    
    for i in 0..<max(arr1.count, arr2.count) {
      let num1 = (i < arr1.count) ? arr1[i] : 0
      let num2 = (i < arr2.count) ? arr2[i] : 0
      if num1 != num2 {
        return num1 > num2 ? 1 : -1
      }
    }
    
    return 0
  }
}
