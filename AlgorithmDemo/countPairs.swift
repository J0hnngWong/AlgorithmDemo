//
//  countPairs.swift
//  AlgorithmDemo
//
//  Created by john on 2023/8/24.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    // No. 1782
    func countPairs(_ n: Int, _ edges: [[Int]], _ queries: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: queries.count)
        var degree = [Int](repeating: 0, count: n)
        var edgeMap: [Int : Int] = [:]
        for pair in edges {
            var start = pair[0] - 1
            var end = pair[1] - 1
            if start > end {
                swap(&start, &end)
            }
            degree[start] += 1
            degree[end] += 1
            edgeMap[start * n + end] = edgeMap[start * n + end] ?? 0 + 1
        }
        degree = degree.mergeSort()
        for (index, query) in queries.enumerated() {
            
            var total = 0
            for i in 0...n - 1 {
                if let queryIndex = degree.binarySearch(query - degree[i]) {
                    total += n - queryIndex
                }
            }
            
            for repeatPair in edgeMap {
                let start = repeatPair.key / n
                let end = repeatPair.key % n
                let repeatCount = repeatPair.value
                if degree[start] + degree[end] > query && degree[start] + degree[end] - repeatCount < query {
                    total -= 1
                }
            }
            result[index] = total
        }
        return result
    }
    
    private func violence(_ n: Int, _ edges: [[Int]], _ queries: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: queries.count)
        for i in 1...n - 1 {
            for j in i + 1...n {
                guard i != j else { continue }
//                let currentPair = (i, j)
                var pairCount = 0
                for pair in edges {
                    if pair.contains(where: { $0 == i || $0 == j }) {
                        pairCount += 1
                    }
                }
                for (index, query) in queries.enumerated() {
                    if pairCount > query {
                        result[index] += 1
                    }
                }
            }
        }
        return result
    }
}
