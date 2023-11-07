//
//  majorityElement.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/7/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

// https://leetcode.cn/problems/majority-element/?envType=study-plan-v2&envId=top-interview-150
extension Solution {
    
    func majorityElement(_ nums: [Int]) -> Int {
        var map: [Int : Int] = [:]
        for num in nums {
            if let _ = map[num] {
                map[num]! += 1
            } else {
                map[num] = 1
            }
        }
        var majorElement = nums[0]
        var maxValue = 0
        for pair in map {
            if pair.value > maxValue {
                maxValue = pair.value
                majorElement = pair.key
            }
        }
        return majorElement
    }
    
    func majorityElementAdvance(_ nums: [Int]) -> Int {
        var candidate = 0
        var value = 0
        for num in nums {
            if value == 0 {
                candidate = num
            }
            if num != candidate {
                value -= 1
            } else if num == candidate {
                value += 1
            }
        }
        return candidate
    }
}
