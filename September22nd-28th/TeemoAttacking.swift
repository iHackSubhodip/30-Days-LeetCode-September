/*
 Question - Teemo Attacking
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/557/week-4-september-22nd-september-28th/3473/
 */

class Solution {
  func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
    guard timeSeries.count > 0 else { return 0 }
    var result = 0
    for i in 0..<timeSeries.count-1{
      result += timeSeries[i+1] - timeSeries[i] <= duration ? (timeSeries[i+1] - timeSeries[i]) : duration
    }
    return result + duration
  }
}
