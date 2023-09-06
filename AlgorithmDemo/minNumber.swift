//
//  minNumber.swift
//  AlgorithmDemo
//
//  Created by Johnny on 9/5/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func minNumber(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var minNum1 = 9
        var minNum2 = 9
        var sameNumbers: [Int] = []
        
        let nums1HasMaxCount = nums1.count > nums2.count
        
        let maxCount = nums1HasMaxCount ? nums1.count : nums2.count
        
        for index in 0...maxCount - 1 {
            if nums1HasMaxCount {
                minNum1 = min(minNum1, nums1[index])
                if index < nums2.count {
                    minNum2 = min(minNum2, nums2[index])
                }
                for nums2Index in 0...nums2.count - 1 {
                    if nums1[index] == nums2[nums2Index] {
                        sameNumbers.append(nums1[index])
                    }
                }
            } else {
                minNum2 = min(minNum2, nums2[index])
                if index < nums1.count {
                    minNum1 = min(minNum1, nums1[index])
                }
                for nums1Index in 0...nums1.count - 1 {
                    if nums2[index] == nums1[nums1Index] {
                        sameNumbers.append(nums2[index])
                    }
                }
            }
            
        }
        if !sameNumbers.isEmpty {
            var minSameNumber = 9
            for sameNumber in sameNumbers {
                minSameNumber = min(sameNumber, minSameNumber)
            }
            return minSameNumber
        }
        return min(minNum1, minNum2) * 10 + max(minNum1, minNum2)
    }
    
    func setInterSection(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var minNum1 = 9
        var minNum2 = 9
        
        let nums1HasMaxCount = nums1.count > nums2.count
        
        let maxCount = nums1HasMaxCount ? nums1.count : nums2.count
        
        let nums1Set = Set(nums1)
        let nums2Set = Set(nums2)
        if let minSameNumber = nums1Set.intersection(nums2Set).min() {
            return minSameNumber
        }
        
        for index in 0...maxCount - 1 {
            if nums1HasMaxCount {
                minNum1 = min(minNum1, nums1[index])
                if index < nums2.count {
                    minNum2 = min(minNum2, nums2[index])
                }
            } else {
                minNum2 = min(minNum2, nums2[index])
                if index < nums1.count {
                    minNum1 = min(minNum1, nums1[index])
                }
            }
        }
        return min(minNum1, minNum2) * 10 + max(minNum1, minNum2)
    }
}
