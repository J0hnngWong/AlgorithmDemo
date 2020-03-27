//
//  main.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/3/20.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

class TestNode {
    var next: TestNode?
}

class Test {
    
    static func testTwoNumberSum() {
        
        let param_1 = ListNode(9)
        let param_2 = ListNode(1)

        param_1.next = ListNode(9)

        var ret = Solution().addTwoNumbers(param_2, param_1)
        while ret != nil {
            print(ret?.val ?? 0)
            ret = ret?.next
        }
    }
    
    static func testLengthOfLongestSubstring() {
        let testArray = ["bbbbbbb", "pwwkew", "abcabcbb", "b", "aa", "au", "", "dvdf"]
        for str in testArray {
            let maxLength = Solution().lengthOfLongestSubstring(str)
            print(maxLength)
        }
    }
    
    static func findMedianSortedArrays() {
        let ret = Solution().findMedianSortedArrays([1,3], [2])
        print(ret)
    }
}

//Test.testTwoNumberSum()
//Test.testLengthOfLongestSubstring()
Test.findMedianSortedArrays()



