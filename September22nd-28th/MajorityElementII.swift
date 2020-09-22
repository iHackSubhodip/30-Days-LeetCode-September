/*
 Question - Majority Element II
 Link - > https://leetcode.com/explore/challenge/card/september-leetcoding-challenge/557/week-4-september-22nd-september-28th/3469/
 */

class Solution {
  func majorityElement(_ nums: [Int]) -> [Int] {
    var elems: [Int: Int] = [:]
    for n in nums {
      elems[n] = (elems[n] ?? 0) + 1
    }
    return elems.compactMap { key, value in
      if value > nums.count / 3 { return key }
      return nil
    }
  }
}
