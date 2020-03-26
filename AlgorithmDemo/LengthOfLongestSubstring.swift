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

        var subStringArray: [Character] = []
        var sRestLength = s.count
        
        var left = 0
        var right = 1
        var maxLength = 0
        
        while right < s.count {
            
        }
        
        return 0
        
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
}

extension String {
    func subString(from: Int, to: Int) -> String {
        if from < to {
            let startIndex = self.index(self.startIndex, offsetBy: from)
            let endIndex = self.index(self.startIndex, offsetBy: to)
            return String(self[startIndex..<endIndex])
        }
        return ""
    }
}
