//
//  checkIfPrerequisite.swift
//  AlgorithmDemo
//
//  Created by Johnny on 9/12/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    
    struct Queue<T> {
        var list: [T] = []
        @discardableResult
        mutating func pop() -> T {
            list.removeLast()
        }
        mutating func push(_ e: T) {
            list.append(e)
        }
        func front() -> T? {
            list.last
        }
        var isEmpty: Bool {
            list.isEmpty
        }
    }
    
    func checkIfPrerequisite(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var indegree = [Int](repeating: 0, count: numCourses)
        var map: [Int: [Int]] = [:]
        var passThroughMatrix = [[Bool]](repeating: [Bool](repeating: false, count: numCourses), count: numCourses)
        for course in prerequisites {
            let pre = course[0]
            let courseId = course[1]
            if let _ = map[pre] {
                map[pre]?.append(courseId)
            } else {
                map[pre] = [courseId]
            }
            indegree[courseId] += 1
        }
        var q = Queue<Int>()
        for (courseId, degree) in indegree.enumerated() {
            if degree == 0 {
                q.push(courseId)
            }
        }
        while !q.isEmpty {
//            guard let current = q.front() else { fatalError("Nonexpect") }
            let current = q.pop()
            for nextPath in map[current] ?? [] {
                passThroughMatrix[current][nextPath] = true
                for index in 0...numCourses - 1 {
                    passThroughMatrix[index][nextPath] = passThroughMatrix[index][nextPath] || passThroughMatrix[index][current]
                }
                indegree[nextPath] -= 1
                if indegree[nextPath] == 0 {
                    q.push(nextPath)
                }
            }
        }
        
        var result: [Bool] = []
        for query in queries {
            result.append(passThroughMatrix[query[0]][query[1]])
        }
        return result
    }
    
    func checkIfPrerequisiteMap(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var map: [Int: [Int]] = [:]
        for course in prerequisites {
            let pre = course[0]
            let courseId = course[1]
            if let _ = map[courseId] {
                map[courseId]?.append(pre)
            } else {
                map[courseId] = [pre]
            }
        }
        var result: [Bool] = []
        for query in queries {
            result.append(queryIfHasChain(map: map, pre: query[0], aiming: query[1]))
        }
        return result
    }
    
    private func queryIfHasChain(map: [Int: [Int]], pre: Int, aiming: Int) -> Bool {
        guard let courses = map[aiming] else { return false }
        for course in courses {
            if course == pre || queryIfHasChain(map: map, pre: pre, aiming: course) {
                return true
            }
        }
        return false
    }
}
