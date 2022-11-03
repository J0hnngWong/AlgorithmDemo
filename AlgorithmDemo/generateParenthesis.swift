//
//  generateParenthesis.swift
//  AlgorithmDemo
//
//  Created by john on 2022/11/3.
//  Copyright © 2022 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    
    func generateParenthesis(_ n: Int) -> [String] {
        return generateParenthesisTreeList(list: ["("], n: n)
    }
    
    func generateParenthesisTreeList(list: [String], n: Int) -> [String] {
        if list.first?.count == n * 2 {
            return list
        }
        var nextLevelList: [String] = []
        for item in list {
            let leftP = item.filter({ $0 == "(" }).count
            let rightP = item.filter({ $0 == ")" }).count
            if rightP < leftP {
                if leftP == n {
                    // only right
                    nextLevelList.append(item + ")")
                } else {
                    // left & right
                    nextLevelList.append(item + "(")
                    nextLevelList.append(item + ")")
                }
            } else {
                // only left
                nextLevelList.append(item + "(")
            }
        }
        return generateParenthesisTreeList(list: nextLevelList, n: n)
    }
}
