//
//  isMatchCustomRegularExpression.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/4/21.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let pArray = Array(p)
        
        var matchRuleArray: [String] = []
        var startPosition = 0
        
        for index in 0...pArray.count-1 {
            if pArray[index] == "*" {
                if !(startPosition > index-2) {
                    matchRuleArray.append(String(pArray[startPosition...index-2]))
                }
                startPosition = index+1
                matchRuleArray.append(String(format: "%@%@", String(pArray[index-1]), String(pArray[index])))
            } else if pArray[index] == "." && index < pArray.count-1 && pArray[index - 1] != "*" {
                if !(startPosition > index-1) {
                    matchRuleArray.append(String(pArray[startPosition...index-1]))
                }
                startPosition = index+1
                matchRuleArray.append(".")
            } else if index == pArray.count-1 {
                matchRuleArray.append(String(pArray[startPosition...index]))
                startPosition = index+1
            }
        }
        
        print(matchRuleArray)
        
        
        
        return false
    }
    
    func match(p: String, rule: [String], pPostion: String, rulePostion: Int) -> Bool {
        return false
    }
}
