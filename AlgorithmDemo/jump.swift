//
//  jump.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/9/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func jump(_ nums: [Int]) -> Int {
        var currentEnd = 0
        var maxPos = 0
        var steps = 0
        for index in 0..<nums.count - 1 {
            maxPos = max(maxPos, index + nums[index])
            if index == currentEnd {
                steps += 1
                currentEnd = maxPos
            }
        }
        return steps
    }
    
    private func jumpTravel(_ nums: [Int], pos: Int, depth: Int, minDepth: inout Int) {
        if nums[pos] == 0 {
            return
        }
        if nums[pos] + pos >= nums.count - 1 {
            minDepth = min(minDepth, depth)
            return
        }
        for sub in 1...nums[pos] {
            jumpTravel(nums, pos: pos + sub, depth: depth + 1, minDepth: &minDepth)
        }
    }
}
