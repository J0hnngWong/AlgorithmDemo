//
//  isPalindromeNumber.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/4/21.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func isPalindrome2(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        if String(x).count == 1 {
            return true
        }
        return String(x) == String(String(x).reversed())
    }
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        let lengthOfX = String(x).count
        if lengthOfX == 1 {
            return true
        }
        var varibleX = x
        var right = 0
        for _ in 0...lengthOfX/2-1 {
            right = right * 10 + varibleX%10
            varibleX /= 10
        }
        
        if lengthOfX%2 != 0 {
            varibleX /= 10
        }
        
        return right == varibleX
    }
}
