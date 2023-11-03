//
//  connectRoot.swift
//  AlgorithmDemo
//
//  Created by Johnny on 11/3/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *       public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

extension Solution {
    private class Node {
        var val: Int
        var left: Node?
        var right: Node?
        var next: Node?
        init(val: Int, left: Node? = nil, right: Node? = nil, next: Node? = nil) {
            self.val = val
            self.left = left
            self.right = right
            self.next = next
        }
    }
    
    private class TravelQueue<T> {
        var list: [T] = []
        var isEmpty: Bool {
            list.isEmpty
        }
        func push(_ element: T) {
            list.append(element)
        }
        func pop() -> T? {
            list.first
        }
    }
    
    private func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        var queue: Queue<Node> = Queue()
        queue.push(root)
        while !queue.isEmpty {
            let size = queue.size()
            var previous: Node? = nil
            for _ in 0...size - 1 {
                let first = queue.pop()
                previous?.next = first
                if let left = first.left {
                    queue.push(left)
                }
                if let right = first.right {
                    queue.push(right)
                }
                previous = first
            }
            previous = nil
        }
        return root
    }
    
    private func connectBreak(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        root.left?.next = root.right
        let subLeftMostNode = connectRight(root.right)
        connectLeft(root.left)?.next = subLeftMostNode
        return root
    }
    
    // 返回为本层最右节点
    private func connectLeft(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        root.left?.next = root.right
        let subLeftMostNode = connectRight(root.right)
        connectLeft(root.left)?.next = subLeftMostNode
        if root.right != nil {
            return root.right
        } else {
            return root.left
        }
    }
    
    // 返回为本层最左节点
    private func connectRight(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        root.left?.next = root.right
        let subLeftMostNode = connectRight(root.right)
        connectLeft(root.left)?.next = subLeftMostNode
        if root.left != nil {
            return root.left
        } else {
            return root.right
        }
    }
}
