//
//  isMatch2.swift
//  AlgorithmDemo
//
//  Created by john on 2022/11/1.
//  Copyright © 2022 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    
    func matchChar(char1: Character, char2: Character) -> Bool {
        return char1 == char2 || char1 == "." || char2 == "."
    }
    
//    func matchChar(str1: String, index1: Int, str2: String, index2: Int) -> Bool {
//        return char1 == char2 || char1 == "." || char2 == "."
//    }
    
    func isMatch2(_ s: String, _ p: String) -> Bool {
        
        var flagMatrix: [[Bool]] = []
        
        flagMatrix.append(contentsOf: [[Bool]].init(repeating: [Bool](repeating: false, count: p.count + 1), count: s.count + 1))
        
        flagMatrix[0][0] = true
        
        for sIndex in 0...s.count {
            for pIndex in 1...p.count {
                if p.character(at: pIndex - 1) == Character("*") {
                    if sIndex != 0, matchChar(char1: s.character(at: sIndex - 1), char2: p.character(at: pIndex - 2)) {
                        let currentflag = flagMatrix[sIndex][pIndex]
                        flagMatrix[sIndex][pIndex] = currentflag || flagMatrix[sIndex - 1][pIndex] || flagMatrix[sIndex][pIndex - 2]
                    } else {
                        let currentflag = flagMatrix[sIndex][pIndex]
                        flagMatrix[sIndex][pIndex] = currentflag || flagMatrix[sIndex][pIndex - 2]
                    }
                } else if sIndex != 0, matchChar(char1: s.character(at: sIndex - 1), char2: p.character(at: pIndex - 1)) {
                    let currentflag = flagMatrix[sIndex][pIndex]
                    flagMatrix[sIndex][pIndex] = currentflag || flagMatrix[sIndex - 1][pIndex - 1]
                }
            }
        }
        return flagMatrix[s.count][p.count]
    }
}
