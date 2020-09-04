/*
 Question - Partition Labels
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/554/week-1-september-1st-september-7th/3448/
 */

class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        guard S.count != 0 else { return [] }
        var dict = [Character: Int](), result = [Int](), array = Array(S)
        var startIndex = 0, endIndex = 0
        for i in 0..<array.count{
            dict[array[i]] = i
        }
        for i in 0..<array.count{
            endIndex = max(endIndex, dict[array[i]]!)
            if endIndex == i{
                result.append(endIndex - startIndex + 1)
                startIndex = endIndex + 1
            }
        }
        return result
    }
}
