/*
 Question - Sum of Root To Leaf Binary Numbers
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/555/week-2-september-8th-september-14th/3453/
 */

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil;self.right = nil; }
  public init(_ val: Int) { self.val = val;self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

class Solution {
  func sumRootToLeaf(_ root: TreeNode?) -> Int {
    var queue: [(TreeNode, Int)] = [(root!, 0)], result: Int = 0
    while queue.count > 0{
      let currentNode = queue.removeLast()
      let currentVal = currentNode.1 << 1 | currentNode.0.val
      if currentNode.0.left == nil && currentNode.0.right == nil{
        result += currentVal
      } else{
        if currentNode.0.right != nil{
          queue.append((currentNode.0.right!, currentVal))
        }
        
        if currentNode.0.left != nil{
          queue.append((currentNode.0.left!, currentVal))
        }
      }
    }
    return result
  }
}
