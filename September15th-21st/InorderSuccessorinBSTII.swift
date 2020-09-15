/*
 Question - Inorder Successor in BST II
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/556/week-3-september-15th-september-21st/3460/
 */

public class Node {
  public var val: Int
  public var left: Node?
  public var right: Node?
  public var parent: Node?
  public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
    self.parent = nil
  }
}


class Solution {
  func inorderSuccessor(_ node: Node?) -> Node? {
    guard let node = node else {return nil}
    if node.right != nil {
      var mostLeft = node.right!
      while mostLeft.left != nil {
        mostLeft = mostLeft.left!
      }
      return mostLeft
    }else{
      var parent = node.parent
      while parent != nil {
        if parent!.val >= node.val {
          return parent
        }
        parent = parent!.parent
      }
    }
    return nil
  }
}
