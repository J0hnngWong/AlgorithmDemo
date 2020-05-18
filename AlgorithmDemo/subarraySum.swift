//
//  subarraySum.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/5/15.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        
        var resultCount = 0
        var sumCountArray: Dictionary<Int, Int> = [0:1]
        var pre = 0
        
        for item in nums {
            pre += item
            if sumCountArray[pre - k] != nil {
                resultCount += sumCountArray[pre - k] ?? 0
            }
            sumCountArray[pre] = ((sumCountArray[pre] != nil ? sumCountArray[pre] : 0) ?? 0) + 1
        }
        
        return resultCount
    }
    
    func subarraySum1(_ nums: [Int], _ k: Int) -> Int {
        
        var resultCount = 0
        var sum = nums[0]
        var l = 0
        var r = 0
        
        while r >= l && l < nums.count {
            if nums[r] >= k {
                if nums[r] == k {
                    resultCount += 1
                }
                l = r + 1
                r += 1
                if r > nums.count-1 {
                    break
                }
                sum = nums[r]
            }
            if sum > k {
                sum -= nums[l]
                l += 1
            } else if sum < k {
                r += 1
                sum += nums[r]
                if r > nums.count-1 {
                    break
                }
            } else if sum == k {
                resultCount += 1
                sum += nums[r]
                sum -= nums[l]
                l += 1
                r += 1
                if r > nums.count-1 {
                    break
                }
            }
        }
        
        return resultCount
    }
}
