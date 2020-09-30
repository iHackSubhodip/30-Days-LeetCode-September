/*
 Question - Word Squares
 Link - > https://leetcode.com/explore/featured/card/september-leetcoding-challenge/558/week-5-september-29th-september-30th/3476/
 */

class Solution {
  func wordSquares(_ words: [String]) -> [[String]] {
    guard !words.isEmpty, words[0].count > 0 else { return [] }
    let n = words[0].count
    
    let trie = Trie(words)
    var ans = [[String]]()
    var path = [String]()
    
    for word in words {
      path.append(word)
      dfs(trie, n, &path, &ans)
      path = []
    }
    
    return ans
  }
  
  func dfs(_ trie: Trie, _ n: Int, _ path: inout [String], _ ans: inout [[String]]) {
    
    if path.count == n {
      ans.append(path)
      return
    }
    
    let index = path.count
    var prefix = ""
    for word in path {
      prefix.append(Array(word)[index])
    }
    
    //Keep in mind each word can be used mulitple times
    let candidates = trie.search(by: prefix)
    for word in candidates {
      path.append(word)
      dfs(trie, n, &path, &ans)
      path.removeLast()
    }
  }
}

class TrieNode {
  var words = [String]()
  var children = [Character:TrieNode]()
}

class Trie {
  var root: TrieNode = TrieNode()
  
  init(_ words: [String]) {
    for word in words {
      insert(word)
    }
  }
  
  func insert(_ word: String) {
    var curr = root
    for c in word {
      if curr.children[c] == nil {
        curr.children[c] = TrieNode()
      }
      curr = curr.children[c]!
      curr.words.append(word)
    }
  }
  
  func search(by prefix: String) -> [String] {
    var curr = root
    for c in prefix {
      if curr.children[c] == nil {
        return []
      }
      curr = curr.children[c]!
    }
    return curr.words
  }
}
