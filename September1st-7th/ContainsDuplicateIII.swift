/*
 Question - Contains Duplicate III
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/554/week-1-september-1st-september-7th/3446/
 */

class Solution {
  func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
    // Edge Cases
    guard k > 0, t >= 0 else { return false }
    var w = (t == 0) ? 1 : t
    var k = k + 1
    
    func getBucket(_ x: Int) -> Int {
      return x < 0 ? ((x + 1) / w) - 1 : x / w
    }
    
    // Bucket
    var buckets = [Int: Int]()
    for i in 0 ..< nums.count {
      // Remove out of Range
      if i - k >= 0 {
        buckets.removeValue(forKey: getBucket(nums[i - k]))
      }
      
      // Check for Match
      let bucket = getBucket(nums[i])
      if buckets[bucket] != nil {
        return true
      }
      else if let num = buckets[bucket + 1], num - nums[i] <= t {
        return true
      }
      else if let num = buckets[bucket - 1], nums[i] - num <= t {
        return true
      }
      buckets[bucket] = nums[i]
    }
    
    return false
  }
}
