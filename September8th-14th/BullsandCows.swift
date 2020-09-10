/*
 Question - Bulls and Cows
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/555/week-2-september-8th-september-14th/3455/
 */

class Solution {
  func getHint(_ secret: String, _ guess: String) -> String {
    let secretArray = Array(secret), guessArray = Array(guess), count = secretArray.count
    var bulls = 0
    var cowsOccuranceStorage = Array(repeating: (0,0), count: 10)
    
    for i in 0..<count{
      let secretValue = Int(String(secretArray[i]))!, guessValue = Int(String(guessArray[i]))!
      if secretValue == guessValue{
        bulls += 1
      }else{
        cowsOccuranceStorage[secretValue].0 += 1
        cowsOccuranceStorage[guessValue].1 += 1
      }
    }
    
    return "\(bulls)A\(cowsOccuranceStorage.map {min($0,$1)}.reduce(0,+))B"
  }
}
