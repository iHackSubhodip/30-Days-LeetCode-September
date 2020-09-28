/*
 Question - Subarray Product Less Than K
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/557/week-4-september-22nd-september-28th/3475/
 */

class Solution {
  func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    guard k > 1 else { return 0 }
    var result = 0, curr = 1, slow = 0
    
    for fast in 0 ..< nums.count {
      curr *= nums[fast]
      while curr >= k {
        curr /= nums[slow]
        slow += 1
      }
      result += (fast - slow + 1)
    }
    
    return result
  }
}
