//
//  bestCoordinate.swift
//  AlgorithmDemo
//
//  Created by john on 2022/11/2.
//  Copyright © 2022 王嘉宁. All rights reserved.
//

import Foundation

/// https://leetcode.cn/problems/coordinate-with-maximum-network-quality/
/// 1620

extension Solution {
    
    func distance(from: [Int], to: [Int]) -> Double {
        let x1 = from[0]
        let y1 = from[1]
        let x2 = to[0]
        let y2 = to[1]
        let xDistance = abs(x1 - x2)
        let yDistance = abs(y1 - y2)
        return sqrt(pow(Double(xDistance), 2) + pow(Double(yDistance), 2))
    }
    
    func signalQuality(from coord: [Int], to tower: [Int], radius: Int) -> Int {
        let towerX = tower[0]
        let towerY = tower[1]
        let qi = tower[2]
        let d = distance(from: coord, to: [towerX, towerY])
        if d > Double(radius) {
            return 0
        }
        let sq = Double(qi) / (Double(1) + d)
        return Int(floor(sq))
    }
    
    func bestCoordinateEnumerator(_ towers: [[Int]], _ radius: Int) -> [Int] {
        
        var result = [0, 0]
        
        let upperX = towers.compactMap({ $0[0] }).max() ?? 0
        let lowerX = towers.compactMap({ $0[0] }).min() ?? 0
        let upperY = towers.compactMap({ $0[1] }).max() ?? 0
        let lowerY = towers.compactMap({ $0[1] }).min() ?? 0
        
        var maxSignalQuality = 0
        
        for x in lowerX...upperX {
            for y in lowerY...upperY {
                var curSignalQuality = 0
                for tower in towers {
                    curSignalQuality += signalQuality(from: [x, y], to: tower, radius: radius)
                }
                if maxSignalQuality < curSignalQuality {
                    result = [x, y]
                    maxSignalQuality = curSignalQuality
                }
            }
        }
        
        return result
    }
    
    func bestCoordinate(_ towers: [[Int]], _ radius: Int) -> [Int] {
        return bestCoordinateEnumerator(towers, radius)
    }
}
