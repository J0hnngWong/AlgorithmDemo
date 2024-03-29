//
//  Algorithm.swift
//  AlgorithmDemo
//
//  Created by john on 2023/8/17.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

class Algorithm {

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
        
        static func testLongestPalindrome() {
            let ret = Solution().longestPalindrome("a")
            print(ret)
        }
        
        static func testConvertZString() {
            let ret = Solution().convert("AB", 1)
            print(ret)
        }
        
        static func testReverseIntNumber() {
            let ret = Solution().reverseSolution(345890643)
            print(ret)
        }
        static func testMyAtoi() {
            let ret = Solution().myAtoi("-2147483649")
            print(ret)
        }
        
        static func testIsPalindromeNumber() {
            let ret = Solution().isPalindrome(124986)
            print(ret)
        }
        
        static func testIsMatchCustomExpression() {
            let ret = Solution().isMatch("iqwbduhw", "mi.p*hdga*h*.*")
            print(ret)
        }
        
        static func testCreateBinaryTree() {
            let ret = CreateBinaryTree.createFullBinaryTree(nodes: [1, 2, 3, 0, 5, 0, 4])
            print(ret)
        }
        
        static func testRightSideViewofBinartTree() {
            let ret = Solution().rightSideView(CreateBinaryTree.createFullBinaryTree(nodes: [1, 2, 3, 0, 5, 0, 4]))
            print(ret)
        }
        
        static func testMergeKLists() {
    //        [
    //          1->4->5,
    //          1->3->4,
    //          2->6
    //        ]
            let rootNode1 = ListNode(1)
            let rootNode2 = ListNode(1)
            let rootNode3 = ListNode(2)
            
            rootNode1.next = ListNode(4)
            rootNode1.next?.next = ListNode(5)
            
            rootNode2.next = ListNode(3)
            rootNode2.next?.next = ListNode(4)
            
            rootNode3.next = ListNode(6)
    //        let testArray = [rootNode1, rootNode2, rootNode3]
            let testArray: [ListNode?] = [nil,nil]
            
            let ret = Solution().mergeKLists(testArray)
            var retPrint = ret
            print(retPrint?.val)
            while retPrint?.next != nil {
                retPrint = retPrint?.next
                print("->\(retPrint?.val)")
            }
        }
        
        static func testSingleNumbers() {
            let ret = Solution().singleNumbers([4, 1, 4, 6])
            print(ret)
        }
        
        static func testMincostTickets() {
    //        [1,4,6,7,8,20]
    //        [2,7,15]
            let ret = Solution1().mincostTickets([1,4,6,7,8,20], [2,7,15])
            print(ret)
        }
        
        static func testMyPow() {
            let ret = Solution().myPow(0.00001, 2147483647)
            print(ret)
        }
        
        static func testMinStack() {
            let stack = MinStack()
            print(stack)
        }
        
        static func subarraySum() {
            let ret = Solution().subarraySum([1,2,1,2,1], 3)
            print(ret)
        }
        
        static func mergeTreeDataGenerator() -> (leftTree: TreeNode?, rightTree: TreeNode?) {
            let left = CreateBinaryTree.createBinaryTree(nodes: [1,3,2,5])
            let right = CreateBinaryTree.createBinaryTree(nodes: [2, 1, 3, nil, 4, nil, 7])
            return (left, right)
        }
        
        static func lcaDeepestLeavesDataGenerator() -> TreeNode? {
            CreateBinaryTree.createBinaryTree(nodes: [3,5,1,6,2,0,8,nil,nil,7,4])
        }
    }
    
    func run() {
        
        var outResult = [1,2]
        let startTime = Date().timeIntervalSince1970
        //Test.testTwoNumberSum()
        //Test.testLengthOfLongestSubstring()
        //Test.findMedianSortedArrays()
        //Test.testLongestPalindrome()
        //Test.testConvertZString()
        //Test.testReverseIntNumber()
        //Test.testMyAtoi()
        //Test.testIsPalindromeNumber()
        //Test.testIsMatchCustomExpression()
        //Test.testCreateBinaryTree()
        //Test.testRightSideViewofBinartTree()
        //Test.testMergeKLists()
        //Test.testSingleNumbers()
        //Test.testMincostTickets()
        //Test.testMyPow()
        //Test.testMinStack()
        //Test.subarraySum()
        let result = Solution()
        //    .arrayStringsAreEqual(["abc", "c"], ["abc"])
        //    .isMatch2("aaa", "ab*a*c*a")
        //    .bestCoordinate([[0,1,2],[2,1,2],[1,0,2],[1,2,2]], 1)
        //    .maxRepeating("abababc", "ba")
        //    .generateParenthesis(3)
        //    .intToRoman(1994)
        //    .splitArraySameAverage([60,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30])
        //    .mergeTrees(Test.mergeTreeDataGenerator().leftTree, Test.mergeTreeDataGenerator().rightTree)
        //    .findReplaceString("vmokgggqzp", [3, 5, 1], ["kg", "ggq", "mo"], ["s", "so", "bfr"])
        //    .findReplaceString("abcde", [2, 2], ["cdef", "bc"], ["f", "fe"])
//            .longestValidParentheses(String(repeating: "(", count: 30000))
//            .maxDistToClosest([0,0,1,0,0,0,0,0,0,0,1])
//            .countPairs(4, [[1,2],[2,4],[1,3],[2,3],[2,1]], [2,3])
//            .countPairs(5, [[1,5],[1,5],[3,4],[2,5],[1,3],[5,1],[2,3],[2,5]], [1,2,3,4,5])
//            .insert([[1,5]], [0,6])
//            .insert([[1,5]], [2,7])
//            .minNumber([4,1,3], [5,7])
//            .minNumber([3,5,2,6], [3,1,7])
//            .lcaDeepestLeaves(Test.lcaDeepestLeavesDataGenerator())
//            .scheduleCourse([[5,5],[4,6],[2,6]])
//            .checkIfPrerequisite(2, [[1,0]], [[0,1],[1,0]])
//            .checkIfPrerequisite(5, [[0,1],[1,2],[2,3],[3,4]], [[0,4],[4,0],[1,3],[3,0]])
//            .maxProduct(["abcw","baz","foo","bar","xtfn","abcdef"])
//            .removeDuplicates(&outResult)
//            .majorityElement([-1,1,1,1,2,1])
//            .rotate(&outResult, 2)
//            .canJump([2,3,1,1,4])
//            .jump([5,6,4,4,6,9,4,4,7,4,4,8,2,6,8,1,5,9,6,5,2,7,9,7,9,6,9,4,1,6,8,8,4,4,2,0,3,8,5])
//            .RandomizedSetTest()
//            .canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2])
            .romanToInt("III")

        let endTime = Date().timeIntervalSince1970

        print("Process Duration: \(endTime - startTime)")
        print(result)
        print(outResult)
    }
}
