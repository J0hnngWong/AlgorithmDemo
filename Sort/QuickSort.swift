//
//  QuickSort.swift
//  AlgorithmDemo
//
//  Created by john on 2023/8/18.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    func quickSort() -> Self {
        
        // 出口
        if count <= 1 {
            return self
        }
        
        // 核心
        var unsort = self
        
        // guard let pivot = last else { return self }
        // or
        let pivot = unsort[count/2]
        // 基准移动到最后的位置
        unsort.swapAt(count/2, count - 1)
        // 基准最终存储位置
        var pivotFinalIndex = 0
        for index in 0...unsort.count - 1 {
            //
            if unsort[index] < pivot {
                unsort.swapAt(pivotFinalIndex, index)
                pivotFinalIndex += 1
            }
        }
        unsort.swapAt(count - 1, pivotFinalIndex)
        
        // 递归入口
        var left: Self = []
        var right: Self = []
        if pivotFinalIndex - 1 >= 0 {
            left = Array(unsort[0...pivotFinalIndex - 1]).quickSort()
        }
        if pivotFinalIndex + 1 <= count - 1 {
            right = Array(unsort[pivotFinalIndex + 1...count - 1]).quickSort()
        }
        return left + [pivot] + right
    }
}
