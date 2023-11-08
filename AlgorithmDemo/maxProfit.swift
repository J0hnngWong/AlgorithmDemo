//
//  maxProfit.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/8/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

// https://leetcode.cn/problems/best-time-to-buy-and-sell-stock/?envType=study-plan-v2&envId=top-interview-150
extension Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var result = 0
        var minPrice = prices[0]
        for i in 1..<prices.count {
            minPrice = min(minPrice, prices[i])
            result = max(result, prices[i] - minPrice)
        }
        return result
    }
}
