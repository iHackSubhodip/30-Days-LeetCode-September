/*
 Question - Combination Sum III
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/555/week-2-september-8th-september-14th/3457/
 */

class Solution {
  func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
    let candidates = [Int](1...9)
    var result: [[Int]] = [], path: [Int] = []
    dfs(&result, &path, candidates, n, 0, k)
    return result
  }
  
  func dfs(_ result: inout [[Int]],_ path: inout [Int],_ candidates: [Int],_ target: Int,_ index: Int,_ size: Int){
    if target == 0 && path.count == size{
      result.append(path)
      return
    }
    
    guard path.count < size else { return }
    for i in index..<candidates.count{
      let candidate = candidates[i]
      guard candidate <= target else { break }
      path.append(candidate)
      dfs(&result,&path, candidates, target - candidate, i+1, size)
      path.removeLast()
    }
  }
}
