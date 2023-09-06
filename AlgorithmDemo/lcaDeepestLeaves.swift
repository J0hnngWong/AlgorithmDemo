//
//  lcaDeepestLeaves.swift
//  AlgorithmDemo
//
//  Created by Johnny on 9/6/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
        var result: TreeNode? = root
        var maxDepth = 0
        findDepth(root, 0, &maxDepth, resultNode: &result)
        return result
    }
    
    @discardableResult
    private func findDepth(_ node: TreeNode?, _ depth: Int, _ maxDepth: inout Int, resultNode: inout TreeNode?) -> Int {
        guard let node = node else { return depth - 1 }
        let leftMaxDepth = findDepth(node.left, depth + 1, &maxDepth, resultNode: &resultNode)
        let rightMaxDepth = findDepth(node.right, depth + 1, &maxDepth, resultNode: &resultNode)
        if leftMaxDepth == rightMaxDepth && leftMaxDepth >= maxDepth {
            resultNode = node
            maxDepth = leftMaxDepth
            return maxDepth
        } else {
            return max(leftMaxDepth, rightMaxDepth)
        }
    }
}
