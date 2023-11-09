//
//  canJump.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/9/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var farPoint = 0
        for index in 0..<nums.count {
            if index <= farPoint {
                farPoint = max(index + nums[index], farPoint)
                if farPoint >= nums.count - 1 {
                    return true
                }
            }
        }
        return false
    }
    
    private func jump(_ nums: [Int], pos: Int) -> Bool {
        if nums[pos] == 0 && pos != nums.count - 1 {
            return false
        }
        for jumpPath in 1...nums[pos] {
            if pos + jumpPath == nums.count - 1 {
                return true
            } else if jump(nums, pos: pos + jumpPath) {
                return true
            }
        }
        return false
    }
}
