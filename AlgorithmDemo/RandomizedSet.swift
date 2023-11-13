//
//  RandomizedSet.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/10/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

class RandomizedSet {
    
    var list: [Int] = []
    var map: [Int: Int] = [:]

    init() {
    }
    
    func insert(_ val: Int) -> Bool {
        if map[val] != nil { return false }
        map[val] = list.count
        list.append(val)
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        if let index = map[val] {
            let last = list[list.count - 1]
            list[index] = last
            map[last] = index
            list.removeLast()
            map.removeValue(forKey: val)
            return true
        } else {
            return false
        }
    }
    
    func getRandom() -> Int {
        list.randomElement()!
    }
}


extension Solution {
    func RandomizedSetTest() -> Bool {
        let set = RandomizedSet()
        set.insert(0)
        set.insert(1)
        set.remove(0)
        set.insert(2)
        set.remove(1)
        let rand = set.getRandom()
        print(rand)
        return true
    }
}
