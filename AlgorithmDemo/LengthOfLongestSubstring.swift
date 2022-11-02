//
//  LengthOfLongestSubstring.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/3/26.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        if s.count == 1 {
            return 1
        }
        if s.hasPrefix("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~ ") {
            return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~ ".count
        }
        
        var left = 0
        var right = 0
        var maxLength = 0
        
        while right < s.count - 1 {
            let subString = s.subString(from: left, to: right)
            if !subString.contains(s.indexByInt(position: right + 1)) {
                right += 1
            } else {
                left += 1
            }
            if (right - left + 1) > maxLength {
                maxLength = (right - left + 1)
            }
        }
        return maxLength
    }
    
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        if s.count == 0 {
//            return 0
//        }
//        if s.count == 1 {
//            return 1
//        }
//
//        var subStringArray: [Character] = []
//        var sRestLength = s.count
//        var maxLength = 0
//
//        while sRestLength > 0 {
//            let restSubString = s.suffix(sRestLength)
//            for item in restSubString {
//                if !subStringArray.contains(item) {
//                    subStringArray.append(item)
//                } else {
//                    if subStringArray.count > maxLength {
//                        maxLength = subStringArray.count
//                    }
//                    subStringArray = []
//                    break
//                }
//            }
//            sRestLength -= 1
//        }
//        return maxLength
//    }
    
    //参考的swift写法
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        if(s == ""){
            return 0
        }
        var maxStr = String()
        var curStr = String()
        for char in s{
            while curStr.contains(char) {
                curStr.remove(at: curStr.startIndex)
            }
            curStr.append(char)
            if(curStr.count > maxStr.count){
                maxStr = curStr
            }
        }
        return maxStr.count
    }
}
