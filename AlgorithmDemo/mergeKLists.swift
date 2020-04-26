//
//  mergeKLists.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/4/26.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

//Definition for singly-linked list.
//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//}

extension Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var listsInside = lists
        listsInside.removeAll { $0 == nil }
        if listsInside.count == 0 {
            return nil
        }
        var resultList = ListNode(0)
        let finalResultListNode = resultList
        while !listsInside.isEmpty {
            var minValue = Int.max
            var minValueIndex = 0
            for index in 0...listsInside.count - 1 {
                guard let currentListNode = listsInside[index] else { continue }
                if currentListNode.val < minValue {
                    minValue = currentListNode.val // 找出最小值
                    minValueIndex = index
                }
            }
            if listsInside[minValueIndex]?.next == nil {
                listsInside.remove(at: minValueIndex)
            } else {
                listsInside[minValueIndex] = listsInside[minValueIndex]?.next //往后移动
            }
            
            let node = ListNode(minValue)
            resultList.next = node
            resultList = resultList.next ?? ListNode(0)
        }
        
        test1(where: { (value) in return true })
        
        return finalResultListNode.next
    }
    
    func test1(where: (Int)->(Bool)?) {
        
    }
    
    func test1(there: (Int)->(Bool)?) {
        
    }
    
}
