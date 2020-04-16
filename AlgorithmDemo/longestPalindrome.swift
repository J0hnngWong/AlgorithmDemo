//
//  longestPalindrome.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/3/27.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.count == 0 {
            return ""
        }
        
        let strArr = Array(s)
        
        var resultArr: [Character] = []
        
        for index in 0...strArr.count-1 {
            let oddNumStr = findPalindrome(string: strArr, left: index, right: index)
            let evenNumStr = findPalindrome(string: strArr, left: index, right: index + 1)
            
            let tempResultArr = oddNumStr.count > evenNumStr.count ? oddNumStr : evenNumStr
            resultArr = tempResultArr.count > resultArr.count ? tempResultArr : resultArr
        }
        return String(resultArr)
    }
    
    func findPalindrome(string: [Character], left: Int, right: Int) -> [Character] {
        var l = left
        var r = right
        while l >= 0 && r < string.count && string[l] == string[r] {
            l -= 1
            r += 1
        }
        if r-1 < l+1 {
            return Array("")
        }
        return Array(string[l+1...r-1])
    }
}
