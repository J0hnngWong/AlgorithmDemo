//
//  arrayStringsAreEqual.swift
//  AlgorithmDemo
//
//  Created by john on 2022/11/1.
//  Copyright © 2022 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        let word1Str = word1.reduce("", { $0 + $1 })
        let word2Str = word2.reduce("", { $0 + $1 })
        return word1Str == word2Str
    }
}
