/*
 Question - Image Overlap
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/554/week-1-september-1st-september-7th/3450/
 */

class Solution {
  func largestOverlap(_ A: [[Int]], _ B: [[Int]]) -> Int {
    func helper(_ a: [[Int]], _ b: [[Int]]) -> Int {
      var result = Int(0)
      let c = a.count
      for i1 in 0..<c {
        for j1 in 0..<c {
          var subresult = Int(0)
          for i2 in i1..<c {
            for j2 in j1..<c where a[i2 - i1][j2 - j1] == 1 && a[i2 - i1][j2 - j1] == b[i2][j2] {
              subresult += 1
            }
          }
          result = max(result, subresult)
        }
      }
      return result
    }
    return max(helper(A, B), helper(B, A))
  }
}
