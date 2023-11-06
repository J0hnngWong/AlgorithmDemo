//
//  maxProduct.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/6/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func maxProduct(_ words: [String]) -> Int {
        var result = 0
        
        var masks: [Int] = [Int](repeating: 0, count: words.count)
        
        for index in 0..<words.count {
            var mask = 0
            let word = words[index]
            for ci in 0..<word.count {
                mask |= 1 << ((word[word.index(word.startIndex, offsetBy: ci)]).asciiValue! - Character("a").asciiValue!)
                masks[index] = mask
            }
        }
        
        for i in 0..<masks.count - 1 {
            for j in i + 1..<masks.count {
                if masks[i] & masks[j] == 0 {
                    result = max(words[i].count * words[j].count, result)
                }
            }
        }
        return result
    }
    
    func maxProductEvery(_ words: [String]) -> Int {
        var result = 0
        for i in 0..<words.count - 1 {
            for j in i + 1..<words.count {
                if Set(words[i]).intersection(Set(words[j])).isEmpty {
                    result = max(words[i].count * words[j].count, result)
                }
            }
        }
        return result
    }
}
