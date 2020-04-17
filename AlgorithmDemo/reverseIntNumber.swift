//
//  reverseIntNumber.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/4/17.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    
    func reverseSolution(_ x: Int) -> Int {
        
        var intNumber: Int = x
        var resultIntNumber: Int = 0
        
        while intNumber != 0 {
            let pop: Int = intNumber%10
            intNumber /= 10
            //先判断除个位前面的数字是否大于，再判断个位 例：x=1221 Int32.max=1234
            if resultIntNumber > (Int32.max / 10) || (resultIntNumber == Int32.max / 10 && pop > Int32.max%10) {
                return 0
            }
            if resultIntNumber < (Int32.min / 10) || (resultIntNumber == Int32.min / 10 && pop < Int32.max%10) {
                return 0
            }
            resultIntNumber = resultIntNumber * 10 + pop
        }
        return resultIntNumber
    }
    
    func reverse(_ x: Int) -> Int {
        
        var intNumberArray: [Int] = []
        var intNumber: Int = x
        var resultIntNumber: Int = 0
        
        while intNumber != 0 {
            intNumberArray.append(intNumber%10)
            intNumber /= 10
        }
        
        var reverseIndex = intNumberArray.count - 1
        var position = 0
        while reverseIndex >= 0 {
            resultIntNumber += intNumberArray[reverseIndex] * Int(pow(Double(10), Double(position)))
            reverseIndex -= 1
            position += 1
        }
        if resultIntNumber >= (Int(pow(Double(2), Double(31))) - 1) || resultIntNumber <= -(Int(pow(Double(2), Double(31)))) {
            return 0
        }
        return resultIntNumber
    }
}
