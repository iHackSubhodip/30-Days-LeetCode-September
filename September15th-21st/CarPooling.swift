/*
 Question - Car Pooling
 Link - > https://leetcode.com/explore/challenge/card/september-leetcoding-challenge/556/week-3-september-15th-september-21st/3467/
 */

class Solution {
  func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
    var passengerCounts = Array(repeating: 0, count: 1001)
    var capacity = capacity
    
    for trip in trips {
      passengerCounts[trip[1]] += trip[0]
      passengerCounts[trip[2]] -= trip[0]
    }
    
    for count in passengerCounts {
      capacity -= count
      if capacity < 0 { return false }
    }
    
    return true
  }
}
