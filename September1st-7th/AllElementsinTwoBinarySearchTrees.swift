/*
 Question - All Elements in Two Binary Search Trees
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/554/week-1-september-1st-september-7th/3449/
 */

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right = nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

class Solution {
  func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
    return (traverse(root1, [Int]()) + traverse(root2, [Int]())).sorted {$0<$1}
  }
  
  func traverse(_ node: TreeNode?, _ traverseHistory: [Int]) -> [Int] {
    guard let node = node else {
      return traverseHistory
    }
    var newHistory = traverse(node.left, traverseHistory)
    newHistory.append(node.val)
    return traverse(node.right, newHistory)
  }
}
