//
//  MergeTrees.swift
//  AlgorithmDemo
//
//  Created by john on 2023/8/14.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    
    private enum NodeType {
        case left
        case right
    }
    
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 else {
            return root2
        }
        guard let root2 else {
            return root1
        }
        let rootNode = TreeNode(root1.val + root2.val)
        rootNode.left = mergeTrees(root1.left, root2.left)
        rootNode.right = mergeTrees(root1.right, root2.right)
        return rootNode
    }
    
    func maunalMergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if let root1, let root2 {
            let resultRootNode = TreeNode(root1.val + root2.val, nil, nil)
            generateNode(root1.left, root2.left, .left, resultParentNode: resultRootNode)
            generateNode(root1.right, root2.right, .right, resultParentNode: resultRootNode)
            return resultRootNode
        } else if let root1 {
            return root1
        } else if let root2 {
            return root2
        }
        return nil
    }
    
    private func generateNode(_ leftTreeNode: TreeNode?, _ rightTreeNode: TreeNode?, _ nodeType: NodeType, resultParentNode: TreeNode?) {
        let node = addNode(leftTreeNode, rightTreeNode)
        switch nodeType {
        case .left:
            resultParentNode?.left = node
        case .right:
            resultParentNode?.right = node
        }
        if let resultLeftNode = resultParentNode?.left {
            generateNode(leftTreeNode?.left, rightTreeNode?.left, .left, resultParentNode: resultLeftNode)
            generateNode(leftTreeNode?.right, rightTreeNode?.right, .right, resultParentNode: resultLeftNode)
        }
        if let resultRightNode = resultParentNode?.right {
            generateNode(leftTreeNode?.left, rightTreeNode?.left, .left, resultParentNode: resultRightNode)
            generateNode(leftTreeNode?.right, rightTreeNode?.right, .right, resultParentNode: resultRightNode)
        }
    }
    
    private func addNode(_ leftTree: TreeNode?, _ rightTree: TreeNode?) -> TreeNode? {
        if let leftTree, let rightTree {
            return TreeNode(leftTree.val + rightTree.val)
        } else if let leftTree {
            return TreeNode(leftTree.val)
        } else if let rightTree {
            return TreeNode(rightTree.val)
        }
        return nil
    }
}
