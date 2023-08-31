//
//  BinarySearch.swift
//  AlgorithmDemo
//
//  Created by john on 2023/8/24.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    enum SortDirection {
        case ascend
        case descend
    }
    
    /// only compatable for ascend sorted array
    func binarySearch(_ e: Element, _ findFirst: Bool = false) -> Array.Index? {
        
        if count == 1 {
            return self[0] == e ? 0 : nil
        }
        
        var result: Array.Index?
        var left = 0
        var right = count - 1
        
        while left <= right {
            var mid = left + (right - left) / 2
            if self[mid] == e {
                if findFirst {
                    while mid >= 0, self[mid] == e {
                        mid -= 1
                    }
                    result = mid + 1
                    break;
                } else {
                    result = mid
                    break;
                }
            } else if self[mid] > e {
                // left
                right = mid - 1
            } else {
                // right
                left = mid + 1
            }
        }
        
        return result
    }
    
    func binarySearchRecursive(_ e: Element) -> Array.Index? {
        var mid = count / 2
        let midValue = self[mid]
        if midValue == e {
            while mid >= 0, self[mid] == e {
                mid -= 1
            }
            return mid + 1
        } else if self[mid] > e {
            // left
            return Array(self[0...mid - 1]).binarySearchRecursive(e)
        } else {
            // right
            return Array(self[mid + 1...count - 1]).binarySearchRecursive(e)
        }
    }
}
