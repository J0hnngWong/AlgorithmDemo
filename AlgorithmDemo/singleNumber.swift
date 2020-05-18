//
//  singleNumber.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/5/14.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var ret = 0
        for item in nums {
            ret = ret ^ item
        }
        return ret
    }
}
