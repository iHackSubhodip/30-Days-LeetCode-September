/*
 Question - Insert into a Sorted Circular Linked List
 Link - > https://leetcode.com/explore/challenge/card/september-leetcoding-challenge/557/week-4-september-22nd-september-28th/3468/
 */

public class Node {
  public var val: Int
  public var next: Node?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}


class Solution {
  func insert(_ head: Node?, _ insertVal: Int) -> Node? {
    guard let head = head else {
      let node = Node(insertVal)
      node.next = node
      return node
    }
    
    var first = head
    var second: Node! = nil
    
    while (first == head && second == nil) || (first != head) {
      
      second = first
      first = first.next!
      
      if second == nil { continue }
      if (first.val > second.val && first.val >= insertVal && second.val <= insertVal)
        || (first.val < second.val && (insertVal <= first.val || insertVal >= second.val)) {
        break
      }
    }
    let node = Node(insertVal)
    second.next = node
    node.next = first
    
    return head
  }
}
