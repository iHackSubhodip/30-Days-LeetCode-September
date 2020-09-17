/*
 Question - Robot Bounded In Circle
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/556/week-3-september-15th-september-21st/3463/
 */

class Solution {
  func isRobotBounded(_ instructions: String) -> Bool {
    var way = 0, coord = (0,0)
    let arr = Array(instructions)
    for ins in arr{
      if ins == "L" {
        way = (way + 1) % 4
      }else if ins == "R"{
        way = (way + 3) % 4
      }else{
        if way == 0 {
          coord.1 += 1
        }else if way == 1{
          coord.0 -= 1
        }else if way == 2{
          coord.1 -= 1
        }else if way == 3{
          coord.0 += 1
        }
      }
    }
    return coord.0 == 0 && coord.1 == 0 || way > 0
  }
}
