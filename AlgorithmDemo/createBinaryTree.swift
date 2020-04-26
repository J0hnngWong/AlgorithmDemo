//
//  createBinaryTree.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/4/22.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

class CreateBinaryTree {
    static func createBinaryTree(nodes: [Int]) -> TreeNode {
        let rootNode = TreeNode(nodes[0])
        
        createBinaryTreeSubNodes(nodes: nodes, node: rootNode, index: 0)
        
        return rootNode
    }
    
    static func createBinaryTreeSubNodes(nodes: [Int], node: TreeNode, index: Int) {
        if index*2+2 >= nodes.count {
            return
        }
        
        var leftNode: TreeNode?
        if nodes[index*2+1] != 0 {
            leftNode = TreeNode(nodes[index*2+1])
        }
        var rightNode: TreeNode?
        if nodes[index*2 + 2] != 0 {
            rightNode = TreeNode(nodes[index*2+2])
        }
        
        node.left = leftNode
        node.right = rightNode
        
        if leftNode != nil {
            createBinaryTreeSubNodes(nodes: nodes, node: leftNode!, index: index*2+1)
        }
        if rightNode != nil {
            createBinaryTreeSubNodes(nodes: nodes, node: rightNode!, index: (index*2)+2)
        }
    }
}
