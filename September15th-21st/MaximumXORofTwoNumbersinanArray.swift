/*
 Question - Maximum XOR of Two Numbers in an Array
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/556/week-3-september-15th-september-21st/3462/
 */

class Solution {
  class Node {
    var val: Int
    var num: Int?
    var zero: Node?
    var one: Node?
    
    var isEnd: Bool {
      return zero == nil && one == nil
    }
    
    init(_ val: Int) {
      self.val = val
    }
  }
  
  class Trie {
    let head: Node
    let startMask: Int
    
    init(maxValue: Int) {
      self.head = Node(0)
      
      var maxBitPos = 0
      var maxCopy = maxValue
      
      while maxCopy > 0 {
        maxCopy = maxCopy/2
        maxBitPos += 1
      }
      
      var mask = 1
      
      for _ in 0..<maxBitPos {
        mask = mask << 1
      }
      
      self.startMask = mask
    }
    
    func insert(_ value: Int) -> Int? {
      var copy = value
      var mask = startMask
      var curr = head
      
      var opposite: Node? = head
      var maxNum = 0
      
      while mask > 0 {
        let bit = copy & mask
        copy = copy & ~mask
        
        maxNum = maxNum << 1
        
        if bit == 0 {
          if curr.zero == nil {
            curr.zero = Node(0)
          }
          curr = curr.zero!
          opposite = opposite?.one ?? opposite?.zero
        }
          
        else {
          if curr.one == nil {
            curr.one = Node(1)
          }
          curr = curr.one!
          opposite = opposite?.zero ?? opposite?.one
        }
        
        if let opposite = opposite {
          maxNum = maxNum + opposite.val^curr.val
        }
        
        if copy == 0 {
          curr.num = value
        }
        
        mask = mask >> 1
      }
      
      return maxNum
    }
  }
  
  func findMaximumXOR(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    
    var trie = Trie(maxValue: nums.max()!)
    var maxXOR = 0
    
    for num in nums {
      if let newMax = trie.insert(num) {
        maxXOR = max(maxXOR, newMax)
      }
    }
    
    return maxXOR
  }
}
