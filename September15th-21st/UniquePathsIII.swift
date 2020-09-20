/*
 Question - Unique Paths III
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/556/week-3-september-15th-september-21st/3466/
 */

class Solution {
  var uniquePath:Int = 0
  
  func uniquePathsIII(_ grid: [[Int]]) -> Int {
    if grid.count == 0 { return 0 }
    var vGrid = grid
    var start:(Int,Int) = (0,0)
    var total = 0
    for i in 0..<vGrid.count{
      for j in 0..<vGrid[0].count{
        if vGrid[i][j] == 1{
          start = (i,j)
        }
        if vGrid[i][j] != -1{
          total += 1
        }
      }
    }
    helper(&vGrid, start.0, start.1,total)
    return uniquePath
  }
  
  func helper(_ grid: inout[[Int]],_ i:Int,_ j:Int,_ total:Int){
    guard i >= 0 && i<grid.count else {
      return
    }
    guard j >= 0 && j<grid[0].count else {
      return
    }
    if grid[i][j] == 2{
      if total == 1 {
        uniquePath += 1
      }
      return
    }else if grid[i][j] == -1{
      return
    }
    let val = grid[i][j]
    grid[i][j] = -1
    helper(&grid, i+1, j, total-1)
    helper(&grid, i-1, j, total-1)
    helper(&grid, i, j+1, total-1)
    helper(&grid, i, j-1,total-1)
    grid[i][j] = val
  }
}
