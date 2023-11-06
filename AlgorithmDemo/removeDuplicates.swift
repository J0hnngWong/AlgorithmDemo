//
//  removeDuplicates.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/6/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var removeNum = 0
        var map = Set<Int>()
        var index = 0
        for i in 0..<nums.count {
            if map.contains(nums[i]) {
                removeNum += 1
            } else {
                nums[i - removeNum] = nums[i]
                map.insert(nums[i])
            }
        }
        nums.removeLast(removeNum)
        return nums.count
    }
    
    func removeDuplicatesSorted(_ nums: inout [Int]) -> Int {
        var current = 0
        for i in 0..<nums.count {
            if nums[current] != nums[i] {
                current += 1
                nums[current] = nums[i]
            }
        }
        nums.removeLast(nums.count - current - 1)
        return nums.count
    }
    
    func removeDuplicatesDoubleSorted(_ nums: inout [Int]) -> Int {
        // [1,2]
        guard nums.count > 1 else { return nums.count }
        var previous = -1
        var current = 0
        for i in 1..<nums.count {
            if nums[current] != nums[i] || previous != nums[i] {
                previous = nums[current]
                current += 1
                nums[current] = nums[i]
            }
        }
        nums.removeLast(nums.count - current - 1)
        return nums.count
    }
}
