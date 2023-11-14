//
//  candy.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/14/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

// https://leetcode.cn/problems/candy/?envType=study-plan-v2&envId=top-interview-150
// ...159... 5 = candy+1
// ...555... 5 = candy-1 | 1
// ...951... 5 = candy-1
// ...155... 5 = candy+1
// ...551... 5 = candy-1
// ...959... 5 = candy-1 | 1
// ...151... 5 = candy+1
// ...559... 5 = candy-1 | 1
// ...955... 5 = candy-1 | 1

// 987 5 43
// 987 555 43
extension Solution {
    func candy(_ ratings: [Int]) -> Int {
        
        var left = [Int](repeating: 1, count: ratings.count)
        
        for index in 0..<ratings.count {
            if index > 0, ratings[index] > ratings[index - 1] {
                left[index] = left[index - 1] + 1
            } else {
                left[index] = 1
            }
        }
        var right = 0
        var result = 0
        for index in 0..<ratings.count {
            let index = ratings.count - 1 - index
            if index < ratings.count - 1, ratings[index] > ratings[index + 1] {
                right += 1
            } else {
                right = 1
            }
            result += max(left[index], right)
        }
        return result
    }
}
