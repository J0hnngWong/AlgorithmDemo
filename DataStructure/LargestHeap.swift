//
//  LargestHeap.swift
//  AlgorithmDemo
//
//  Created by Johnny on 9/11/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

struct LargestHeap<T: Comparable> {
    private var list: [T] = []
    mutating func push(_ e: T) {
        list.append(e)
        guard list.count > 1 else { return }
        var son = list.count - 1
        var father = (son - 1) / 2
        while list[father] < list[son] && father >= 0 {
            list.swapAt(father, son)
            son = father
            father = (son - 1) / 2
        }
    }
    
    @discardableResult
    mutating func pop() -> T? {
        let result = list.last
        list.swapAt(0, list.count - 1)
        list.removeLast()
        var father = 0
        var son = 1
        while son <= list.count - 1 {
            if son < list.count - 1 && list[son] < list[son + 1] {
                son += 1
            }
            if list[father] < list[son] {
                list.swapAt(father, son)
                father = son
                son = father * 2 + 1
            } else {
                break
            }
        }
        return result
    }
    
    var count: Int {
        list.count
    }
    
    var top: T? {
        list.first
    }
    
    var isEmpty: Bool {
        list.isEmpty
    }
}
