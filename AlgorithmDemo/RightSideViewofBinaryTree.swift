//
//  RightSideViewofBinaryTree.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/4/22.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation
 
extension Solution {
    
    func rightSideView(_ root: TreeNode?) -> [Int] {
        if root == nil { return []}
        var resultArray: [Int] = []
        resultArray.append(root?.val ?? 0)
        travesal(node: root, depth: 0, result: &resultArray)
        print(resultArray)
        return resultArray
    }
    
    func travesal(node: TreeNode?, depth: Int, result: inout [Int]) {
        print("node val: \(node?.val ?? 0) + \n")
        print("depth: \(depth)\n")
        if node?.left != nil {
            if depth + 1 >= result.count {
                result.append(node?.left?.val ?? 0)
            } else {
                result[depth + 1] = node?.left?.val ?? 0
            }
            travesal(node: node?.left, depth: depth + 1, result: &result)
        }
        if node?.right != nil {
            if depth + 1 >= result.count {
                result.append(node?.right?.val ?? 0)
            } else {
                result[depth+1] = node?.right?.val ?? 0
            }
            travesal(node: node?.right, depth: depth + 1, result: &result)
        }
    }
}
