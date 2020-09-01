/*
 Question - Largest Time for Given Digits
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/554/week-1-september-1st-september-7th/3445/
 */

class Solution {
  func largestTimeFromDigits(_ A: [Int]) -> String {
    var vals = A.sorted()
    var result = ""
    if let index = vals.lastIndex(of: 2) {
      result += String(vals.remove(at: index))
      
      if let index = vals.lastIndex(where: {$0 < 4} ) {
        result += String(vals.remove(at: index)) + ":"
        
        if let index = vals.lastIndex(where: {$0 < 6} ) {
          result += String(vals.remove(at: index)) + String(vals[0])
        }
        
      }
    }
    
    if result.count == 5 {
      return result
    }
    
    vals = A.sorted()
    result = ""
    
    if let index = vals.lastIndex(where: {$0 < 2}) {
      result += String(vals.remove(at: index)) + String(vals.remove(at: 2)) + ":"
      
      if let index = vals.lastIndex(where: {$0 < 6} ) {
        result += String(vals.remove(at: index)) + String(vals[0])
      }
      
      
    }
    
    if result.count == 5 {
      return result
    } else {
      return ""
    }
    
  }
}
