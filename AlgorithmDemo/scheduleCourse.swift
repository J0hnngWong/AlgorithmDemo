//
//  scheduleCourse.swift
//  AlgorithmDemo
//
//  Created by Johnny on 9/11/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func scheduleCourse(_ courses: [[Int]]) -> Int {
        let deadlineList = courses.mergeSort(by: { $1[1] > $0[1] })
        var current = 0
        var heap = LargestHeap<Int>()
        for deadline in deadlineList {
            if current + deadline[0] <= deadline[1] {
                current += deadline[0]
                heap.push(deadline[0])
            } else if let heapTop = heap.top, heapTop > deadline[0] {
                current -= heapTop - deadline[0]
                heap.pop()
                heap.push(deadline[0])
            }
        }
        return heap.count
    }
    
    func scheduleCourseFail(_ courses: [[Int]]) -> Int {
        var deadlineMap: [Int:[[Int]]] = [:]
        for course in courses {
            if var deadlineCourses = deadlineMap[course[1] - course[0]] {
                let insertIndex = binarySearchInsertIndex(deadlineCourses, course)
                if insertIndex == deadlineCourses.count {
                    deadlineCourses.append(course)
                } else {
                    deadlineCourses.insert(course, at: insertIndex)
                }
                deadlineMap[course[1] - course[0]] = deadlineCourses
            } else {
                deadlineMap[course[1] - course[0]] = [course]
            }
        }
        var currentDay = 0
        var courseCount = 0
        let deadlineKeys = deadlineMap.keys.sorted()
        for deadline in deadlineKeys {
            if let deadlineValue = deadlineMap[deadline] {
                for course in deadlineValue {
                    if currentDay + course[0] <= course[1] {
                        currentDay += course[0]
                        courseCount += 1
                    }
                }
            }
        }
        return courseCount
    }
    
    func binarySearchInsertIndex(_ list: [[Int]], _ aiming: [Int]) -> Array.Index {
        var left = 0
        var right = list.count - 1
        let mid = (left + right) / 2
        while left <= right {
            if list[mid][0] == aiming[0] {
                return mid + 1
            } else if list[mid][0] > aiming[0] {
                if mid - 1 < 0 {
                    return 0
                } else if list[mid - 1][0] < aiming[0] {
                    return mid
                } else {
                    right = mid - 1
                }
            } else if list[mid][0] < aiming[0] {
                if mid + 1 >= list.count {
                    return list.count
                } else if list[mid + 1][0] > aiming[0] {
                    return mid + 1
                } else {
                    left = mid + 1
                }
            }
        }
        return right
    }
}
