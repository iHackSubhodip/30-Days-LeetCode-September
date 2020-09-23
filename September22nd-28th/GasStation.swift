/*
 Question - Gas Station
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/557/week-4-september-22nd-september-28th/3470/
 */

class Solution {
  func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var answer = -1
    func travel (_ currentIndex:Int, _ target:Int, _ tank: Int, _ initial:Bool) {
      var copy = tank
      copy += gas[currentIndex]
      if currentIndex == target, !initial {
        answer = target
        return
      }
      copy -= cost[currentIndex]
      guard copy >= 0 else {
        return
      }
      guard currentIndex+1 <= gas.count-1 else {
        travel(0,target,copy,false)
        return
      }
      travel(currentIndex+1,target,copy,false)
    }
    
    for index in 0..<gas.count {
      travel(index,index,0,true)
    }
    return answer
  }
}
