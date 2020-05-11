//
//  myPow.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/5/11.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        return n > 0 ? powCus(x, n) : 1 / powCus(x, -n)
    }
    
    func powCus(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        let y = powCus(x, n/2)
        return n%2 == 0 ? y * y : y * y * x
    }
}
