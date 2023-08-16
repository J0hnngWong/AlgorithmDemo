//
//  longestValidParentheses.swift
//  AlgorithmDemo
//
//  Created by john on 2023/8/15.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    private struct Stack<T> {
        var list: [T] = []
        mutating func push(_ element: T) {
            list.append(element)
        }
        
        mutating func pop() -> T? {
            list.popLast()
        }
        
        func stackCount() -> Int {
            list.count
        }
    }
    
    func longestValidParentheses(_ s: String) -> Int {
        var maxdp = 0
        guard s.count >= 2 else {
            return maxdp
        }
        var dp = [Int](repeating: 0, count: s.count)
        for index in 1..<s.count {
            /// 30000次循环的话，
            /// 如果
            /// let lastIndex = index - 1
            /// 和
            /// let lastStringIndex = s.index(s.startIndex, offsetBy: lastIndex)
            /// 这两句放在外面每次执行，则会多出2秒
            /// 总时间会从2.3秒上涨到4.5秒
            if s[s.index(s.startIndex, offsetBy: index)] == ")" {
                let lastIndex = index - 1
                if s[s.index(s.startIndex, offsetBy: lastIndex)] == "(" {
                    dp[index] = (index < 2 ? 0 : dp[index - 2]) + 2
                } else if (lastIndex - dp[lastIndex] >= 0) && s[s.index(s.startIndex, offsetBy: lastIndex - dp[lastIndex])] == "(" {
                    let previousLastMactchIndex = lastIndex - dp[lastIndex] - 1
                    dp[index] = (previousLastMactchIndex >= 0 ? dp[previousLastMactchIndex] : 0) + dp[lastIndex] + 2
                }
            }
            maxdp = max(maxdp, dp[index])
        }
        return maxdp
    }
    
    @discardableResult
    private func find(_ s: String, index: Int, maxCount: inout Int) -> Int {
        
        if index == 0 {
            return 0
        } else if index == 1 {
            if (s[s.index(s.startIndex, offsetBy: index)] == "(") {
                return 0
            } else if (s[s.index(s.startIndex, offsetBy: index)] == ")") {
                if (s[s.index(s.startIndex, offsetBy: index - 1)] == "(") {
                    maxCount = 2
                    return 2
                } else if (s[s.index(s.startIndex, offsetBy: index - 1)] == ")") {
                    return 0
                }
            }
        }
        
        let stringIndex = s.index(s.startIndex, offsetBy: index)
        let lastStringIndex = s.index(s.startIndex, offsetBy: index - 1)
        
        if s[stringIndex] == "(" {
            return find(s, index: index - 1, maxCount: &maxCount)
        } else if s[stringIndex] == ")" {
            if s[lastStringIndex] == "(" {
                let result = find(s, index: index - 1, maxCount: &maxCount) + 2
                maxCount = max(result, maxCount)
                return result
            } else if s[lastStringIndex] == ")" {
                return find(s, index: index - 1, maxCount: &maxCount)
            }
        }
        return 0
    }
    
    func manualLongestValidParentheses(_ s: String) -> Int {
        var stack = Stack<Character>()
        var maxValidLength = 0
        var currentValidLength = 0
        for index in 0..<s.count {
            let stringIndex = s.index(s.startIndex, offsetBy: index)
            let char = s[stringIndex]
            if char == "(" {
                stack.push(char)
            } else if char == ")" {
                let element = stack.pop()
                if let element = element {
                    if element != "(" {
                        stack.push(element)
                        stack.push(char)
                        currentValidLength = 0
                    } else {
                        // 匹配成功
                        currentValidLength += 1
                        maxValidLength = max(maxValidLength, currentValidLength)
                    }
                } else {
                    stack.push(char)
                }
            }
        }
        return s.count - stack.stackCount()
    }
}

private class Thinking {
    func think() {
        let result = """
        
        ( ) ( ( ( ) ( ) ) ) ) (
        0 2 0 0 0 2 0 4 6 8 0
        
        dp[n]为子串合法括号长度
        
        s[i] = "(":
            dp[i] = 0
        
        s[i] = ")" && s[i - 1] = "(" :
            dp[i] = dp[i - 2] + 2
        
        s[i] = ")" && s[i - 1] = ")" :
            s[i - 1 - dp[i - 1]] = "(" : (我觉得还差一个条件：s[i - 2 - dp[i - 1]] = "(")
                dp[i] = dp[i - 1] + dp[i - 2 - dp[i - 1]] + 2
        
        """
        let a = """
        f(n) =
        
        {
            n = "(": f(n - 1)
            n = ")":    {
                            n - 1 = "(": f(n - 1) + 2
                            n - 1 = ")": f(n - 1)
                        }
        }
        
        f(1) =
        
        {
            1 = "(": f(0)
            1 = ")":    {
                            0 = "(": 2
                            0 = ")": 0
                        }
        }
        
        f(0) =
        
        {
            0 = "(": 0
            0 = ")": 0
        }
        """
    }
}
