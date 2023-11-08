//
//  maxProfit2.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/8/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

// https://leetcode.cn/problems/best-time-to-buy-and-sell-stock-ii/?envType=study-plan-v2&envId=top-interview-150
extension Solution {
    func maxProfit2(_ prices: [Int]) -> Int {
        var result = 0
        var holdShare = 0
        for i in 1..<prices.count {
            var profit = prices[i] - prices[holdShare]
            if profit < 0 {
                holdShare = i
            } else {
                result += profit
                holdShare = i
            }
        }
        return result
    }
}
