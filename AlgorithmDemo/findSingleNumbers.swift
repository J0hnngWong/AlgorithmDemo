//
//  findSingleNumbers.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/4/28.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    
    func singleNumbers(_ nums: [Int]) -> [Int] {
        if nums.count < 2 {
            return nums
        }
        //求所有数字异或结果
        var exclusiveOrResult = 0
        for item in nums {
            exclusiveOrResult = item ^ exclusiveOrResult
        }
        //找到两个数字异或结果的最低位1在哪，这一步就是找出两个数字最低一位不同的1和0出现在哪
        var mask = 1
        while (mask & exclusiveOrResult) == 0 {
            mask <<= 1 //左移一位
        }
        //按规则分组， 这样下来a里面一定包含那个最低一位与b不同的为0的数字，b里面包含与a不同的最低一位为1的数字，结果的这两个数字就被分开了，同时相同的数字异或之后为0所以a和b一定是结果值
        var a = 0
        var b = 0
        for item in nums {
            if (item & mask) == 0 {
                a ^= item
            } else {
                b ^= item
            }
        }
        
        return [a, b]
    }
    
    func singleNumbers1(_ nums: [Int]) -> [Int] {
        var resultArray: [Int] = []
        
        for item in nums {
            if resultArray.contains(item) {
                resultArray.removeFirst(item)
            } else {
                resultArray.append(item)
            }
        }
        
        return resultArray
    }
}
