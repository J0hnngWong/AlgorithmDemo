//
//  mySqrt.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/5/9.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func mySqrt(_ x: Int) -> Int {
        if x == 0 {
            return 0
        }
        var l = 1
        var r = x
        var ans = -1
        var mid: Int = (l + r) / 2
        
        while l <= r {
            mid = (l + r) / 2
            let sqrtMid = mid * mid
            if sqrtMid > x {
                r = mid - 1
            } else if sqrtMid < x {
                ans = mid
                l = mid + 1
            } else if sqrtMid == x {
                return mid
            }
        }
        
        return ans
    }
}
