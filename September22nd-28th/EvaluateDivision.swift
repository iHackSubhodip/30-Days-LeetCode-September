/*
 Question - Evaluate Division
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/557/week-4-september-22nd-september-28th/3474/
 */

class Solution {
  func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
    var graph = [String : [(String, Double)]]()
    
    for i in 0..<equations.count {
      let equation = equations[i], value = values[i]
      let from = equation[0], to = equation[1]
      graph[from, default: []].append((to, value))
      graph[to, default: []].append((from, 1 / value))
    }
    
    var visited = Set<String>()
    return queries.map { calc(&graph, $0[0], $0[1], &visited) }
  }
  
  func calc(_ graph: inout [String : [(String, Double)]], _ from: String, _ to: String, _ visited: inout Set<String>) -> Double {
    guard graph[from] != nil && graph[to] != nil else { return -1.0 }
    if from == to { return 1.0 }
    
    visited.insert(from)
    var ans: Double = -1.0
    for (next, value) in graph[from]! where !visited.contains(next) {
      let nextValue = calc(&graph, next, to, &visited)
      if nextValue > 0 {
        ans = value * nextValue
        break
      }
    }
    visited.remove(from)
    
    // update graph for faster searching
    if ans > 0 {
      graph[from, default: []].append((to, ans))
      graph[to, default: []].append((from, 1 / ans))
    }
    return ans
  }
}
