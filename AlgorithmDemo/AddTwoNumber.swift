//
//  AddTwoNumber.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/3/20.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
 
extension Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var resultList: ListNode = ListNode(0)
        let resultListNode: ListNode = resultList
        var l1Node = l1
        var l2Node = l2
        var needCarry = false//[2,4,3] [5,6,4]
        while l1Node != nil && l2Node != nil {
            var newVal = l1Node!.val + l2Node!.val
            if needCarry {
                newVal += 1
            }
            if newVal >= 10 {
                newVal = newVal % 10
                needCarry = true
            } else {
                needCarry = false
            }
            
            let newNode = ListNode(newVal)
            resultList.next = newNode
            l1Node = l1Node?.next
            l2Node = l2Node?.next
            resultList = resultList.next!
        }
        if l1Node != nil {
            repeat {
                var newVal = l1Node!.val
                if needCarry {
                    newVal += 1
                }
                
                if newVal >= 10 {
                    newVal = newVal % 10
                    needCarry = true
                } else {
                    needCarry = false
                }
                
                resultList.next = ListNode(newVal)
                resultList = resultList.next!
                l1Node = l1Node?.next
            } while l1Node != nil
        }
        if l2Node != nil {
            repeat {
                var newVal = l2Node!.val
                if needCarry {
                    newVal += 1
                }
                
                if newVal >= 10 {
                    newVal = newVal % 10
                    needCarry = true
                } else {
                    needCarry = false
                }
                
                resultList.next = ListNode(newVal)
                resultList = resultList.next!
                l2Node = l2Node?.next
            } while l2Node != nil
        }
        if needCarry {
            resultList.next = ListNode(1)
        }
        return resultListNode.next
    }
}
