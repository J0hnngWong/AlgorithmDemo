//
//  maxRepeating.swift
//  AlgorithmDemo
//
//  Created by john on 2022/11/3.
//  Copyright © 2022 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    
    func maxRepeating(_ sequence: String, _ word: String) -> Int {
        var curCount = 0
        let sequenceCount = sequence.count
        let wordCount = word.count
        let maxCount = Int(floor(Double(sequenceCount) / Double(wordCount)))
        if maxCount <= 0 {
            return maxCount
        }
        for count in 1...maxCount {
            let curWord = [String](repeating: word, count: count).joined()
            if !sequence.isSubString(child: curWord) {
                return curCount
            } else {
                curCount += 1
                continue
            }
        }
        return curCount
    }
}
