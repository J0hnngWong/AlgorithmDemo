//
//  hIndex.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/10/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let sortedCitations = citations.mergeSort(by: { $0 > $1 })
        var hResult = 0
        for index in 0..<sortedCitations.count {
            if sortedCitations[index] < index + 1 {
                break
            }
            hResult += 1
        }
        return hResult
    }
}
