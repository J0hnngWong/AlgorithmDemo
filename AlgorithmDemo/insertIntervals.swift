//
//  insertIntervals.swift
//  AlgorithmDemo
//
//  Created by john on 2023/8/28.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard intervals.count > 0 else { return [newInterval] }
        var result: [[Int]] = []
        
        var insertInterval = newInterval
        
        for index in 0..<intervals.count {
            let inLowerBound = intervals[index][0]
            let inUpperBound = intervals[index][1]
            if insertInterval[0] > inUpperBound {
                result.append(intervals[index])
                if index == intervals.count - 1 {
                    result.append(insertInterval)
                }
            } else if insertInterval[1] < inLowerBound {
                result.append(insertInterval)
                if index <= intervals.count - 1 {
                    result.append(contentsOf: Array(intervals[index...intervals.count - 1]))
                }
                break;
            } else if (insertInterval[0] >= intervals[index][0] || insertInterval[1] <= intervals[index][1]) || (insertInterval[0] <= intervals[index][0] && insertInterval[1] >= intervals[index][1]) {
                // 有相交的部分
                insertInterval[0] = min(inLowerBound, insertInterval[0])
                insertInterval[1] = max(inUpperBound, insertInterval[1])
                if index == intervals.count - 1 {
                    result.append(insertInterval)
                }
            }
        }
        
        return result
    }
}
