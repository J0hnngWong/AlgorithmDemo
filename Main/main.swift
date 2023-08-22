//
//  main.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/3/20.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

func executeMeasure(_ label: String, _ block: (() -> ())) {
    let startTime = Date().timeIntervalSince1970
    block()
    let endTime = Date().timeIntervalSince1970
    print("\(label) cost: \(endTime - startTime)")
}

func runAlgorithm() {
    Algorithm().run()
}

func runSort() {
    let count = 100000
    var list: [Int] = []
    for _ in 0...count-1 {
        list.append(Int.random(in: 0...count-1))
    }
    
    executeMeasure("recursive merge sort") {
        let _ = list.recursiveMergeSort()
    }
    
    executeMeasure("merge sort") {
        let _ = list.mergeSort()
    }
    
    executeMeasure("quick sort") {
        let _ = list.quickSort()
//        guard qList.ascendValid(), qList.count == list.count else { fatalError("List is Not Ascend or Not Full!") }
    }
    
    executeMeasure("system sort") {
        let _ = list.sorted()
    }
    
    print("end")
}

//runSort()
runAlgorithm()
