/*
 Question - Length of Last Word
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/556/week-3-september-15th-september-21st/3461/
 */

class Solution {
  func lengthOfLastWord(_ s: String) -> Int {
    return s.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ").last?.count ?? 0
  }
}
