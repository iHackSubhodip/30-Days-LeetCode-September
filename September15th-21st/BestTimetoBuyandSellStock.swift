/*
 Question - Best Time to Buy and Sell Stock
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/556/week-3-september-15th-september-21st/3464/
 */

class Solution {
  func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 0 else {return 0}
    var maxProfit = 0
    var buyDay = 0
    
    for i in 1 ..< prices.count {
      let profit = prices[i] - prices[buyDay]
      if profit < 0 {
        buyDay = i
      }
      maxProfit = max(profit, maxProfit)
    }
    
    return maxProfit
  }
}
