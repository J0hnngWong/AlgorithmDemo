//
//  mincostTickets.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/5/6.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

class Solution1 {
    
    var resultArray: [Int?] = Array(repeating: nil, count: 366)
    var travelDays: [Int]?
    var costsList: [Int]?
    
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        travelDays = days
        costsList = costs
        return dp(from: 1)
    }
    
    func dp(from day: Int) -> Int {
        if day > 365 {
            return 0
        }
        if resultArray[day] != nil {
            return resultArray[day] ?? 0
        }
        if travelDays?.contains(day) ?? false {
            resultArray[day] = min((costsList?[0] ?? 0)+dp(from: day+1), (costsList?[1] ?? 0)+dp(from: day+7), (costsList?[2] ?? 0)+dp(from: day+30))
        } else {
            resultArray[day] = dp(from: day + 1)
        }
        return resultArray[day] ?? 0
    }
}
