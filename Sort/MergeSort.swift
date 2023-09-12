//
//  MergeSort.swift
//  AlgorithmDemo
//
//  Created by john on 2023/8/16.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    func mergeSort() -> Self {
        
        var unsort = self
        var processing = unsort
        
        var steps = 1
        
        while steps < count {
            // index ... index + steps
            
            var leftIndex = 0
            while leftIndex < count {
                
                var currentProcessingIndex = leftIndex
                
                var leftCurrentIndex = leftIndex
                var rightCurrentIndex = Swift.min(leftIndex + steps, count - 1)
                
                let leftEndCurrentIndex = rightCurrentIndex - 1
                let rightEndCurrentIndex = Swift.min(rightCurrentIndex + steps - 1, count - 1)
                
                while leftCurrentIndex <= leftEndCurrentIndex && rightCurrentIndex <= rightEndCurrentIndex {
                    let leftValue = unsort[leftCurrentIndex]
                    let rightValue = unsort[rightCurrentIndex]
                    if leftValue < rightValue {
                        processing[currentProcessingIndex] = leftValue
                        leftCurrentIndex += 1
                        currentProcessingIndex += 1
                    } else { // if rightValue < leftValue
                        processing[currentProcessingIndex] = rightValue
                        rightCurrentIndex += 1
                        currentProcessingIndex += 1
                    }
                }
                
                while leftCurrentIndex <= leftEndCurrentIndex {
                    processing[currentProcessingIndex] = unsort[leftCurrentIndex]
                    currentProcessingIndex += 1
                    leftCurrentIndex += 1
                }
                
                while rightCurrentIndex <= rightEndCurrentIndex {
                    processing[currentProcessingIndex] = unsort[rightCurrentIndex]
                    currentProcessingIndex += 1
                    rightCurrentIndex += 1
                }
                
                leftIndex += steps * 2
            }
            
            let lastState = unsort
            unsort = processing
            processing = lastState // 将之前状态中的数据放下来，确保后面再进行时不需要动的数据可以直接放下来
            
            steps *= 2
        }
        
        let sorted = unsort
        
        return sorted
    }
}

extension Array where Element: Comparable {
    func recursiveMergeSort() -> Self {
        
        if count == 1 {
            return self
        }
        
        let mid = count / 2
        let leftList = Array(self[0...mid - 1]).recursiveMergeSort()
        let rightList = Array(self[mid...count - 1]).recursiveMergeSort()
        
        let unsort = leftList + rightList
        
        var currentIndex = 0
        
        var leftStartIndex = 0
        let leftEndIndex = mid - 1
        var rightStartindex = mid
        let rightEndIndex = count - 1
        
        var result: [Element] = unsort
        
        while leftStartIndex <= leftEndIndex && rightStartindex <= rightEndIndex {
            let leftValue = unsort[leftStartIndex]
            let rightValue = unsort[rightStartindex]
            if leftValue < rightValue {
                result[currentIndex] = leftValue
                leftStartIndex += 1
                currentIndex += 1
            } else {
                result[currentIndex] = rightValue
                rightStartindex += 1
                currentIndex += 1
            }
        }
        
        while leftStartIndex <= leftEndIndex {
            result[currentIndex] = unsort[leftStartIndex]
            leftStartIndex += 1
            currentIndex += 1
        }
        
        while rightStartindex <= rightEndIndex {
            result[currentIndex] = unsort[rightStartindex]
            rightStartindex += 1
            currentIndex += 1
        }
        
        return result
    }
}

extension Array {
    func mergeSort(by using: ((_ l: Element, _ r: Element) -> Bool)) -> Self {
        var unsort = self
        var processing = unsort
        
        var steps = 1
        
        while steps < count {
            // index ... index + steps
            
            var leftIndex = 0
            while leftIndex < count {
                
                var currentProcessingIndex = leftIndex
                
                var leftCurrentIndex = leftIndex
                var rightCurrentIndex = Swift.min(leftIndex + steps, count - 1)
                
                let leftEndCurrentIndex = rightCurrentIndex - 1
                let rightEndCurrentIndex = Swift.min(rightCurrentIndex + steps - 1, count - 1)
                
                while leftCurrentIndex <= leftEndCurrentIndex && rightCurrentIndex <= rightEndCurrentIndex {
                    let leftValue = unsort[leftCurrentIndex]
                    let rightValue = unsort[rightCurrentIndex]
                    if using(leftValue, rightValue) {
                        processing[currentProcessingIndex] = leftValue
                        leftCurrentIndex += 1
                        currentProcessingIndex += 1
                    } else { // if rightValue < leftValue
                        processing[currentProcessingIndex] = rightValue
                        rightCurrentIndex += 1
                        currentProcessingIndex += 1
                    }
                }
                
                while leftCurrentIndex <= leftEndCurrentIndex {
                    processing[currentProcessingIndex] = unsort[leftCurrentIndex]
                    currentProcessingIndex += 1
                    leftCurrentIndex += 1
                }
                
                while rightCurrentIndex <= rightEndCurrentIndex {
                    processing[currentProcessingIndex] = unsort[rightCurrentIndex]
                    currentProcessingIndex += 1
                    rightCurrentIndex += 1
                }
                
                leftIndex += steps * 2
            }
            
            let lastState = unsort
            unsort = processing
            processing = lastState // 将之前状态中的数据放下来，确保后面再进行时不需要动的数据可以直接放下来
            
            steps *= 2
        }
        
        let sorted = unsort
        
        return sorted
    }
}
