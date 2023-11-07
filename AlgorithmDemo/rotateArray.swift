//
//  rotateArray.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/7/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
//        var final = Array(nums[nums.count - k...nums.count - 1])
//        final.reverse()
        let realK = k % nums.count
        if realK == 0 || nums.count == 1 { return }
        var result: [Int] = []
        for _ in 0...realK - 1 {
            result.insert(nums.removeLast(), at: 0)
        }
        result.append(contentsOf: nums)
        nums = result
    }
}
