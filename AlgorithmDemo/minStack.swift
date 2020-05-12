//
//  minStack.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/5/12.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

class MinStack {
    var array: [Int] = []
    var minArray: [Int] = []
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        array.append(x)
        guard let minNum = minArray.last else {
            minArray.append(x)
            return
        }
        if minNum < x {
            minArray.append(minNum)
        } else if minNum >= x {
            minArray.append(x)
        }
    }
    
    func pop() {
        array.removeLast()
        minArray.removeLast()
    }
    
    func top() -> Int {
        return array.last ?? 0
    }
    
    func getMin() -> Int {
        return minArray.last ?? 0
    }
}

extension MinStack {
    func debugPrint() {
        print("array: \(array) \nminArray: \(minArray)")
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
