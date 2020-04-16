//
//  convertZString.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/4/16.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        var drift = false
        let strArr = Array(s)
        
        var resultArray: [[Character]] = [[]]
//        for _ in 0...numRows-1 {
//            let newArr: [Character] = []
//            resultArray.append(newArr)
//        }
        var lineNum = 0 // 行
        var rowNum = 0 // 列
        for index in 0...strArr.count-1 {
            if !drift {
                //直行代码
                resultArray[lineNum][rowNum] = strArr[index] //放数据
                lineNum += 1 // 光标只竖向移动
                if lineNum >= numRows - 1 || lineNum <= 0 {
                    if lineNum > numRows - 1 {
                        lineNum = numRows - 1
                    }
                    drift = true // 需要转弯了
                }
            } else {
                //转弯代码
                lineNum -= 1
                rowNum += 1
                resultArray[lineNum][rowNum] = strArr[index]
                if lineNum <= 0 {
                    if lineNum < 0 {
                        lineNum = 0
                    }
                    drift = false // 需要直行了
                }
            }
        }
        
        var finalResultArray: [Character] = []
        
        for resultLineArr in resultArray {
            for resultChar in resultLineArr {
                finalResultArray.append(resultChar)
            }
        }
        
        return String(finalResultArray)
    }
}
