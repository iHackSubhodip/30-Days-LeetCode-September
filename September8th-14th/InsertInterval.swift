/*
 Question - Insert Interval
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/555/week-2-september-8th-september-14th/3458/
 */

class Solution {
  func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var result: [[Int]] = [], new = newInterval, index = 0
    
    while index < intervals.count && intervals[index][1] < new[0]{
      result.append(intervals[index])
      index += 1
    }
    
    while index < intervals.count && intervals[index][0] <= new[1]{
      new[0] = min(intervals[index][0], new[0])
      new[1] = max(intervals[index][1], new[1])
      index += 1
    }
    
    result.append(new)
    
    while index < intervals.count{
      result.append(intervals[index])
      index += 1
    }
    return result
  }
}
