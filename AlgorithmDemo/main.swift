//
//  main.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/3/20.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

print("Hello, World!")

let sol = Solution()
print(sol.twoSum([3,2,4], 6))

class TestNode {
    var next: TestNode?
}

class Test {
    
    static func test1() {
        var node1: TestNode?
        var node2: TestNode?
        while true {
            let newNode = TestNode()
            
            if node1 == nil {
                node1 = newNode
                node2 = node1
            } else {
                node1?.next = newNode
            }
            node1 = node1?.next
            
            print("")
        }
        
    }
    
    static func test() {
        
//        let param_1 = ListNode(0)
//        let param_2 = ListNode(0)
        
        let param_1 = ListNode(2)
        let param_2 = ListNode(5)

        param_1.next = ListNode(4)
        param_1.next?.next = ListNode(3)

        param_2.next = ListNode(6)
        param_2.next?.next = ListNode(4)

        let ret = Solution().addTwoNumbers(param_1, param_2)
        var resultNode = sol.addTwoNumbers(param_1, param_2) //[2,4,3] [5,6,4]
        while resultNode != nil {
            print(resultNode?.val ?? 0)
            resultNode = resultNode?.next
        }
    }
}

Test.test()
Test.test1()



