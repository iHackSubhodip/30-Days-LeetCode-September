/*
 Question - Word Break
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/558/week-5-september-29th-september-30th/3477/
 */

class Solution {
  func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var wordDictSet = [String: Bool]()
    var dp = Array(repeating: false, count: s.count+1)
    dp[0] = true
    wordDict.forEach({ (word: String) in
      wordDictSet[word] = true
    })
    
    for i in 1...s.count{
      for j in 0..<i{
        let subString = String(Array(s)[j..<i])
        if dp[j] && wordDictSet.keys.contains(subString){
          dp[i] = true
          break
        }
      }
    }
    return dp.last!
  }
}
