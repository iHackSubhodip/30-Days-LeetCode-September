/*
 Question - House Robber
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/555/week-2-september-8th-september-14th/3459/
 */

class Solution {
  func rob(_ nums: [Int]) -> Int {
    var current = 0, prev = 0
    
    for num in nums{
      (current, prev) = (max(current, prev+num), current)
    }
    
    return current
  }
}
