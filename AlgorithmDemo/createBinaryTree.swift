//
//  createBinaryTree.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/4/22.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

// * Definition for a binary tree node.
public class TreeNode: CustomDebugStringConvertible {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    public var debugDescription: String {
        "\(val)"
    }
    
    func travelsal(_ node: TreeNode?) {
        print("\(node?.debugDescription ?? "nil")")
    }
}

class CreateBinaryTree {
    
    static func createBinaryTree(nodes: [Int?]) -> TreeNode? {
        guard let rootNodeVal = nodes[0] else { return nil }
        let rootNode = TreeNode(rootNodeVal)
        
        createBinaryTreeSubNodes(nodes: nodes, node: rootNode, index: 0)
        
        return rootNode
    }
    
    static func createBinaryTreeSubNodes(nodes: [Int?], node: TreeNode?, index: Int) {
        
        var leftNode: TreeNode?
        if index * 2 + 1 < nodes.count, let leftNodeVal = nodes[index * 2 + 1] {
            leftNode = TreeNode(leftNodeVal)
        }
        var rightNode: TreeNode?
        if index * 2 + 2 < nodes.count, let rightNodeVal = nodes[index * 2 + 2] {
            rightNode = TreeNode(rightNodeVal)
        }
        
        node?.left = leftNode
        node?.right = rightNode
        
        if leftNode != nil {
            createBinaryTreeSubNodes(nodes: nodes, node: leftNode, index: index*2+1)
        }
        if rightNode != nil {
            createBinaryTreeSubNodes(nodes: nodes, node: rightNode, index: (index*2)+2)
        }
    }
    
    static func createFullBinaryTree(nodes: [Int]) -> TreeNode {
        let rootNode = TreeNode(nodes[0])
        
        createBinaryTreeSubNodes(nodes: nodes, node: rootNode, index: 0)
        
        return rootNode
    }
    
    static func createFullBinaryTreeSubNodes(nodes: [Int], node: TreeNode, index: Int) {
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
