//
//  romanToInt.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/14/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
//    I             1
//    V             5
//    X             10
//    L             50
//    C             100
//    D             500
//    M             1000
//    I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
//    X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
//    C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
    func romanToInt(_ s: String) -> Int {
        let map: [Character : Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        var result = 0
        for index in 0..<s.count {
            let char = s[s.index(s.startIndex, offsetBy: index)]
            guard index < s.count - 1 else {
                result += map[char] ?? 0
                continue
            }
            let nextChar = s[s.index(s.startIndex, offsetBy: index + 1)]
            let currentValue = map[char] ?? 0
            let nextValue = map[nextChar] ?? 0
            if nextValue > currentValue {
                result -= currentValue
            } else {
                result += currentValue
            }
        }
        return result
    }
    
    private func romanToIntMax(_ s: String) -> Int {
        let map: [Character : Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        var result = 0
        var jumpNext = false
        for index in 0..<s.count {
            if jumpNext {
                jumpNext = false
                continue
            }
            let char = s[s.index(s.startIndex, offsetBy: index)]
            guard index < s.count - 1 else {
                result += map[char] ?? 0
                continue
            }
            let nextChar = s[s.index(s.startIndex, offsetBy: index + 1)]
            switch char {
            case "I":
                switch nextChar {
                case "V":
                    result += 4
                    jumpNext = true
                    continue
                case "X":
                    result += 9
                    jumpNext = true
                    continue
                default:break
                }
            case "X":
                switch nextChar {
                case "L":
                    result += 40
                    jumpNext = true
                    continue
                case "C":
                    result += 90
                    jumpNext = true
                    continue
                default:break
                }
            case "C":
                switch nextChar {
                case "D":
                    result += 400
                    jumpNext = true
                    continue
                case "M":
                    result += 900
                    jumpNext = true
                    continue
                default:break
                }
            default:break
            }
            result += map[char] ?? 0
        }
        return result
    }
}
