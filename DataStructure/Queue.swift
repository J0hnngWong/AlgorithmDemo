//
//  Queue.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/3/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

struct Queue<T> {
    var list: [T] = []
    @discardableResult
    mutating func pop() -> T {
        list.removeFirst()
    }
    mutating func push(_ e: T) {
        list.append(e)
    }
    func front() -> T? {
        list.first
    }
    func size() -> Int {
        list.count
    }
    var isEmpty: Bool {
        list.isEmpty
    }
}
