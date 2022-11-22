//
//  intToRoman.swift
//  AlgorithmDemo
//
//  Created by john on 2022/11/3.
//  Copyright © 2022 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    
    var intRomanMap: [Int : String] {
        return [
            1 : "I",
            5 : "V",
            10 : "X",
            50 : "L",
            100 : "C",
            500 : "D",
            1000 : "M"
        ]
    }
    
    var intRomanFullMap: [Int : String] {
        return [
            1 : "I",
            4 : "IV",
            5 : "V",
            9 : "IX",
            10 : "X",
            40 : "XL",
            50 : "L",
            90 : "XC",
            100 : "C",
            400 : "CD",
            500 : "D",
            900 : "CM",
            1000 : "M"
        ]
    }
    
    func intToRoman(_ num: Int) -> String {
        return intToRomanSolution1(num)
    }
    
    func intToRomanSolution1(_ num: Int) -> String {
        var resultStr = ""
        var resultNum = num
        let sortedKeys = intRomanFullMap.keys.sorted()
        while resultNum > 1 {
            guard let maxKey = sortedKeys.reversed().first(where: { resultNum >= $0 }) else { fatalError() }
            resultNum -= maxKey
            guard let maxRoman = intRomanFullMap[maxKey] else { fatalError() }
            resultStr += maxRoman
        }
        if resultNum == 1 {
            resultStr += "I"
        }
        return resultStr
    }
    
    func intToRomanSolution2(_ num: Int) -> String {
        let split = splitNum(num: num)
        if isSpecialRoman(num: split.remainNum) {
            return generateSpecialRoman(num: num, processingStr: "")
        } else {
            return generateNormalRoman(num: num, processingStr: "")
        }
    }
    
    func splitNum(num: Int) -> (remainNum: Int, count: Int) {
        var remainNum = Double(num)
        var count = 0
        while remainNum > 10 {
            remainNum /= 10
            count += 1
        }
        return (remainNum: Int(remainNum), count: count)
    }
    
    func isSpecialRoman(num: Int) -> Bool {
        num == 4 || num == 9
    }
    
    func generateSpecialRoman(num: Int, processingStr: String) -> String {
        if let baseNum = intRomanMap[num] {
            return "\(processingStr)\(baseNum)"
        }
        if num <= 0 {
            return processingStr
        }
        let split = splitNum(num: num)
        let powCount = split.count
        let remainNum = Double(split.remainNum)
        let maxBitNum = remainNum * pow(10, Double(powCount))
        let fixBitNum = pow(10, Double(powCount))
        let increasingKeys = intRomanMap.keys.sorted()
        guard let parentRomanKey = increasingKeys.first(where: { $0 > Int(maxBitNum) }) else { fatalError() }
        guard let parentRoman = intRomanMap[Int(parentRomanKey)] else { fatalError() }
        guard let fixRoman = intRomanMap[Int(fixBitNum)] else { fatalError() }
        let resultNum = num - Int(maxBitNum)
        let resultSplit = splitNum(num: resultNum)
        let isSpecial = isSpecialRoman(num: resultSplit.remainNum)
        if isSpecial {
            return generateSpecialRoman(num: resultNum, processingStr: "\(processingStr)\(fixRoman)\(parentRoman)")
        } else {
            return generateNormalRoman(num: resultNum, processingStr: "\(processingStr)\(fixRoman)\(parentRoman)")
        }
    }
    
    func generateNormalRoman(num: Int, processingStr: String) -> String {
        if let baseNum = intRomanMap[num] {
            return "\(processingStr)\(baseNum)"
        }
        if num <= 0 {
            return processingStr
        }
        var processingNum = num
        var resultStr = processingStr
        let increasingKeys = intRomanMap.keys.sorted()
        var maxKey = 1
        for item in increasingKeys {
            if processingNum >= item {
                maxKey = item
            }
        }
        while processingNum > maxKey {
            guard let romanStr = intRomanMap[maxKey] else {
                fatalError()
            }
            resultStr += romanStr
            processingNum -= maxKey
        }
        let split = splitNum(num: processingNum)
        let isSpecial = isSpecialRoman(num: split.remainNum)
        if isSpecial {
            return generateSpecialRoman(num: processingNum, processingStr: resultStr)
        } else {
            return generateNormalRoman(num: processingNum, processingStr: resultStr)
        }
    }
}
