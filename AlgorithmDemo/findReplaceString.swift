//
//  findReplaceString.swift
//  AlgorithmDemo
//
//  Created by john on 2023/8/15.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

// 833. 字符串中的查找与替换
extension Solution {
    func findReplaceString(_ s: String, _ indices: [Int], _ sources: [String], _ targets: [String]) -> String {
        var result = ""
        var realIndexList: [Int] = []
        for index in 0..<indices.count {
            realIndexList.append(index)
        }
        realIndexList.sort(by: { indices[$0] < indices[$1] })
        let sortedIndices = indices.sorted()
        guard let firstIndex = sortedIndices.first else { return s }
        if firstIndex > 0 {
            result.append(contentsOf: s.subString(from: 0, to: firstIndex - 1))
        }
        for (index, sortedIndex) in realIndexList.enumerated() {
            
            let startIndex = indices[sortedIndex]
            
            let matchSubString = sources[sortedIndex]
            var endIndex = startIndex + matchSubString.count - 1
            endIndex = endIndex > s.count - 1 ? s.count - 1 : endIndex
            let sSubString = s.subString(from: startIndex, to: endIndex)
            
            let shouldAppendIfNotMatch = (index + 1 < sortedIndices.count && sortedIndices[index + 1] > startIndex) || index == sortedIndices.count - 1
            
            if matchSubString == sSubString {
                result.append(contentsOf: targets[sortedIndex])
            } else if shouldAppendIfNotMatch {
                result.append(contentsOf: sSubString)
            }
            if index + 1 < sortedIndices.count, endIndex + 1 <= sortedIndices[index + 1] - 1 {
                result.append(contentsOf: s.subString(from: endIndex + 1, to: sortedIndices[index + 1] - 1))
            }
            if index == sortedIndices.count - 1, endIndex + 1 <= s.count - 1 {
                result.append(contentsOf: s.subString(from: endIndex + 1, to: s.count - 1))
            }
        }
        return result
    }
}
