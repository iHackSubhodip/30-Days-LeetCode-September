/*
 Question - Largest Number
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/557/week-4-september-22nd-september-28th/3472/
 */

class Solution {
  func largestNumber(_ nums: [Int]) -> String {
    let result = nums.map { "\($0)" }.sorted(by: { $0 + $1 > $1 + $0 }).joined()
    return result.first == "0" ? "0" : result
  }
}
