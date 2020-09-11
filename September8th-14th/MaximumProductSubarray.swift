/*
 Question - Maximum Product Subarray
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/555/week-2-september-8th-september-14th/3456/
 */

class Solution {
  func maxProduct(_ nums: [Int]) -> Int {
    var answer = nums[0], maxSoFar = nums[0], minSoFar = nums[0]
    
    for i in 1..<nums.count{
      var a = maxSoFar * nums[i], b = minSoFar * nums[i]
      maxSoFar = max(a, b, nums[i])
      minSoFar = min(a, b, nums[i])
      answer = max(maxSoFar, answer)
    }
    return answer
  }
}
