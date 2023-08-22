//
//  maxDistToClosest.swift
//  AlgorithmDemo
//
//  Created by john on 2023/8/22.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

// https://leetcode.cn/problems/maximize-distance-to-closest-person/
extension Solution {
    // No.849
    func maxDistToClosest(_ seats: [Int]) -> Int {
        // 最左边和最右边的最长距离是第一个1和最后一个1距离开头或结尾的长度，中间的最长距离是两个1之间的距离除2
//        var firstDist = -1
        var currentDist = 0
        var maxDist = -1
        for seat in seats {
            if seat == 1 {
                if maxDist < 0 {
                    maxDist = currentDist
                } else if currentDist > 0 {
                    maxDist = max((currentDist + 1)/2, maxDist)
                }
                currentDist = 0
            } else {
                currentDist += 1
            }
        }
        maxDist = max(maxDist, currentDist)
        return maxDist
    }
}
