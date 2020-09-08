/*
 Question - Moving Average from Data Stream
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/555/week-2-september-8th-september-14th/3452/
 */

class MovingAverage {

    let maxSize: Int
    var sum = 0, numbers = [Int]()
    
    /** Initialize your data structure here. */
    init(_ size: Int) {
        self.maxSize = size
    }
    
    func next(_ val: Int) -> Double {
        numbers.append(val)
        sum += val
        if numbers.count > maxSize { sum -= numbers.removeFirst() }
        return Double(sum) / Double(numbers.count)
    }
}

/**
 * Your MovingAverage object will be instantiated and called as such:
 * let obj = MovingAverage(size)
 * let ret_1: Double = obj.next(val)
 */
