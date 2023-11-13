//
//  productExceptSelf.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/13/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var leftProduct = [Int](repeating: 1, count: nums.count)
        var rightProduct = [Int](repeating: 1, count: nums.count)
        for i in 0..<nums.count - 1 {
            leftProduct[i + 1] = leftProduct[i] * nums[i]
            rightProduct[nums.count - i - 2] = rightProduct[nums.count - i - 1] * nums[nums.count - i - 1]
        }
        for i in 0..<leftProduct.count {
            rightProduct[i] *= leftProduct[i]
        }
        return rightProduct
    }
}
