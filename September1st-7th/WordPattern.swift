/*
 Question - Word Pattern
 Link - > https://leetcode.com/explore/challenge/card/september-leetcoding-challenge/554/week-1-september-1st-september-7th/3451/
 */

class Solution {
  func wordPattern(_ pattern: String, _ str: String) -> Bool {
    let wordArray = str.components(separatedBy: " ")
    let patternArray = pattern.map { String($0) }
    // print(wordArray)
    // print(patternArray)
    if wordArray.count != patternArray.count { return false }
    var dict: [String: String] = [:]
    for (index, value) in patternArray.enumerated(){
      if dict.keys.contains(value){
        if dict[value] != wordArray[index]{
          return false
        }
      }else{
        if dict.values.contains(wordArray[index]){
          return false
        }else{
          dict[value] = wordArray[index]
        }
      }
      // print(dict)
    }
    return true
  }
}
