//
//  canCompleteCircuit.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/13/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var index = 0
        
        while index < gas.count {
            
            var steps = 0
            var gasLeft = 0
            while steps < gas.count {
                let c = (index + steps) % gas.count
                gasLeft += gas[c]
                gasLeft -= cost[c]
                if gasLeft < 0 {
                    break
                }
                steps += 1
            }
            
            if steps == gas.count {
                return index
            } else {
                index = index + steps + 1
            }
        }
        return -1
    }
    
    private func canCompleteCircuitMax(_ gas: [Int], _ cost: [Int]) -> Int {
        for i in 0..<gas.count {
            guard !(gas[i] == 0 || cost[i] == 0) else { continue }
            if canCompleteTravel(gas, cost, startIndex: i) {
                return i
            }
        }
        return -1
    }
    
    private func canCompleteTravel(_ gas: [Int], _ cost: [Int], startIndex: Int) -> Bool {
        guard gas[startIndex] >= cost[startIndex] else {
            return false
        }
        let finalPoint = startIndex
        var currentIndex = startIndex
        var gasLeft = 0
        repeat {
            gasLeft += gas[currentIndex]
            guard cost[currentIndex] != 0 else {
                currentIndex = (currentIndex + 1) % gas.count
                continue
            }
            gasLeft -= cost[currentIndex]
            currentIndex = (currentIndex + 1) % gas.count
            if gasLeft < 0 {
                return false
            }
        } while finalPoint != currentIndex
        return true
    }
}
