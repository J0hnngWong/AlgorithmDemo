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
    
    static func test() {
        
//        let param_1 = ListNode(0)
//        let param_2 = ListNode(0)
        
        let param_1 = ListNode(9)
        let param_2 = ListNode(1)

        param_1.next = ListNode(9)
//        param_1.next?.next = ListNode(3)

//        param_2.next = ListNode(6)
//        param_2.next?.next = ListNode(4)

        var ret = Solution().addTwoNumbers(param_2, param_1)
//        var resultNode = sol.addTwoNumbers(param_1, param_2) //[2,4,3] [5,6,4]
        while ret != nil {
            print(ret?.val ?? 0)
            ret = ret?.next
        }
    }
}

Test.test()



