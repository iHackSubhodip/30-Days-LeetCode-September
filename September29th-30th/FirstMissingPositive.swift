/*
 Question - First Missing Positive
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/558/week-5-september-29th-september-30th/3478/
 */

class Solution {
  func firstMissingPositive(_ nums: [Int]) -> Int {
    var nums = nums
    
    for i in nums.indices{
      while nums[i] >= 1 && nums[i] < nums.count && nums[nums[i] - 1] != nums[i]{
        nums.swapAt(i, nums[i] - 1)
      }
    }
    for i in nums.indices{
      if nums[i] != i + 1{
        return i + 1
      }
    }
    return nums.count + 1
  }
}
