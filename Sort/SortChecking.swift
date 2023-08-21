//
//  SortChecking.swift
//  AlgorithmDemo
//
//  Created by john on 2023/8/21.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    func ascendValid() -> Bool {
        for index in 1..<count {
            guard self[index] >= self[index - 1] else { return false }
        }
        return true
    }
    
    func descendValid() -> Bool {
        for index in 1..<count {
            guard self[index] <= self[index - 1] else { return false }
        }
        return true
    }
}
