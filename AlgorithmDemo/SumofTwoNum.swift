//
//  SumofTwoNum.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/3/20.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // 自己的解法 暴力法
        let numsCopy = Array(nums)
        for itemX in 0...nums.count - 1 {
            for itemY in 0...numsCopy.count - 1 {
                if nums[itemX] + nums[itemY] == target && itemX != itemY {
                    return [itemX, itemY]
                }
            }
        }
        
        // 答案思想 hashMap
        for item in 0...nums.count - 1 {
            let diff = target - nums[item]
            guard let targetIndex = nums.firstIndex(of: diff) else { continue }
            if nums.contains(diff) && item != targetIndex {
                return [item, targetIndex]
            }
        }
        return []
    }
}
