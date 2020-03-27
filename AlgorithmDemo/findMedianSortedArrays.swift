//
//  findMedianSortedArrays.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/3/27.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums1Pos = 0
        var nums2Pos = 0
        var nums: [Int] = []
        
        while nums1Pos < nums1.count && nums2Pos < nums2.count {
            if nums1[nums1Pos] < nums2[nums2Pos] {
                nums.append(nums1[nums1Pos])
                nums1Pos += 1
            } else if nums1[nums1Pos] >= nums2[nums2Pos] {
                nums.append(nums2[nums2Pos])
                nums2Pos += 1
            }
        }
        
        if nums1Pos < nums1.count {
            for index in nums1Pos...(nums1.count - 1) {
                nums.append(nums1[index])
            }
        }
        if nums2Pos < nums2.count {
            for index in nums2Pos...(nums2.count - 1) {
                nums.append(nums2[index])
            }
        }
        if nums.count % 2 == 0 {
            let midPosition = (nums.count / 2)
            return Double(nums[midPosition] + nums[midPosition - 1]) / 2
        } else {
            return Double(nums[nums.count / 2])
        }
        
    }
}
