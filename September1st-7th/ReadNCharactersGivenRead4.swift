/*
 Question - Read N Characters Given Read4
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/554/week-1-september-1st-september-7th/3444/
 */

/**
 * The read4 API is defined in the parent class Reader4.
 *     func read4(_ buf4: inout [Character]) -> Int;
 */

class Solution : Reader4 {
  /**
   * @param buf Destination buffer
   * @param n   Number of characters to read
   * @return    The number of actual characters read
   */
  func read(_ buf: inout [Character], _ n: Int) -> Int {
    var bytesToRead = n
    var buffer = [Character](repeating:" ",count:4)
    var bytesRead = 0
    while bytesToRead > 0{
      bytesRead = min(read4(&buffer),bytesToRead)
      buf.replaceSubrange((n - bytesToRead)..<(n - bytesToRead + bytesRead),with:buffer)
      bytesToRead -= bytesRead
      guard bytesRead == 4 else{break}
    }
    return n-bytesToRead
  }
}
