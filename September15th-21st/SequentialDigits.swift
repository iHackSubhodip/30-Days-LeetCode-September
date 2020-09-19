/*
 Question - Sequential Digits
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/556/week-3-september-15th-september-21st/3465/
 */

class Solution {
  func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
    var arr : [Int] = []
    for i in String(low).count...String(high).count{
      for j in 1...9{
        if j + i > 10{
          break
        }
        let ar = Array(j..<j+i).map({String($0)})
        arr.append(Int(ar.reduce("", {$0 + $1}))!)
      }
    }
    return arr.filter({$0 >= low && $0 <= high})
  }
}
