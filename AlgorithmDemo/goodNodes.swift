//
//  goodNodes.swift
//  AlgorithmDemo
//
//  Created by john on 2023/8/25.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func goodNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return findGoodNodes(root, root.val)
    }
    
    func findGoodNodes(_ root: TreeNode, _ maxValue: Int) -> Int {
        var goodNodeCount = 0
        var maxValue = maxValue
        if root.val >= maxValue {
            maxValue = root.val
            // good node
            goodNodeCount += 1
        }
        if let left = root.left {
            goodNodeCount += findGoodNodes(left, maxValue)
        }
        if let right = root.right {
            goodNodeCount += findGoodNodes(right, maxValue)
        }
        return goodNodeCount
    }
}
