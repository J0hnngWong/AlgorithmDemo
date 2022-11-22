//
//  splitArraySameAverage.swift
//  AlgorithmDemo
//
//  Created by john on 2022/11/14.
//  Copyright © 2022 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func splitArraySameAverage(_ nums: [Int]) -> Bool {
        return splitArraySameAverageSolution(nums)
    }
    
    func splitArraySameAverageSolution(_ nums: [Int]) -> Bool {
        let average = average(nums: nums)
        for (index, item) in nums.enumerated() {
            var tempNums = nums
            tempNums.remove(at: index)
            let result = checkCurrentAve([item], restNums: tempNums, totalAve: average)
            if result {
                return true
            }
        }
        return false
    }
    
    func checkCurrentAve(_ nums: [Int], restNums: [Int], totalAve: Double) -> Bool {
        if nums.isEmpty || restNums.isEmpty {
            return false
        }
        if average(nums: nums) == totalAve && average(nums: restNums) == totalAve {
            return true
        }
        for (index, item) in restNums.enumerated() {
            var nextTotal = restNums
            nextTotal.remove(at: index)
            let result = checkCurrentAve(nums + [item], restNums: nextTotal, totalAve: totalAve)
            if result {
                return true
            }
        }
        return false
    }
    
    func average(nums: [Int]) -> Double {
        return Double(nums.reduce(0, { $0 + $1 })) / Double(nums.count)
    }
}
