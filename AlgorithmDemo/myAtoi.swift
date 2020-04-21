//
//  myAtoi.swift
//  AlgorithmDemo
//
//  Created by 王嘉宁 on 2020/4/17.
//  Copyright © 2020 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    
    var stateTable: [String:[String]] {
                                //" "   +/-     0-9     other
        return ["start"     :["start", "signed", "readNum", "end"],
                "signed"    :["end", "end", "readNum", "end"],
                "readNum"   :["end", "end", "readNum", "end"],
                "end"       :["end", "end", "end", "end"]
               ]
    }
    
    func myAtoi(_ str: String) -> Int {
        let strArray = Array(str)
        
        var state = "start"
        var sign = 1
        var ans = 0
        
        for item in strArray {
            state = read(c: item, state: state)
            if state == "signed" {
                if item == "-" {
                    sign = -1
                }
            } else if state == "readNum" {
                if sign > 0 {
                    if ans * sign > Int32.max/10 || ((ans * sign == Int32.max/10) && (Int(String(item)) ?? 0) * sign >= Int32.max%10) {
                        return Int(Int32.max)
                    }
                } else if sign < 0 {
                    if ans * sign < Int32.min/10 || ((ans * sign == Int32.min/10) && (Int(String(item)) ?? 0) * sign <= Int32.min%10) {
                        return Int(Int32.min)
                    }
                }
                ans = ans * 10 + (Int(String(item)) ?? 0)
            } else if state == "end" {
                break
            }
        }
        
        return ans * sign
    }
    
    func read(c: String.Element, state: String) -> String {
        var stateNum = 0
        if c == " " {
            stateNum = 0
        } else if c == "+" || c == "-" {
            stateNum = 1
        } else if ("0"..."9").contains(c) {
            stateNum = 2
        } else {
            stateNum = 3
        }
        
        return stateTable[state]?[stateNum] ?? "end"
    }
    
    //状态机
    func myAtoi1(_ str: String) -> Int {
        
        
        var strArr: [Character] = Array(str)
        var intStr: [Character] = []
        var reverse = false
//        strArr = intStr.map{ ("0"..."9").contains($0) || "-".contains($0) ? $0 : " " }.filter { $0 != " " }
        strArr = strArr.filter { $0 != " " }
        
        if strArr.count == 0 {
            return 0
        }
        
        if strArr[0] != "-" && !("0"..."9").contains(strArr[0]) && strArr[0] != " " && strArr[0] != "+" {
            return 0
        }
        if strArr[0] == "-" {
            reverse = true
            strArr.remove(at: 0)
        } else if strArr[0] == "+" {
            reverse = false
            strArr.remove(at: 0)
        }
        
        if strArr.count == 0 {
            return 0
        }
//        strArr = strArr.filter { $0 != "-" && $0 != "+" }
        for item in strArr {
            if !("0"..."9").contains(item) {
                return  greaterThanMax(x: reverse ? -(Int(String(intStr)) ?? 0) : Int(String(intStr)) ?? 0)
            } else {
                intStr.append(item)
            }
        }
        return greaterThanMax(x: reverse ? -(Int(String(intStr)) ?? 0) : Int(String(intStr)) ?? 0)
    }
    
    func greaterThanMax(x: Int) -> Int {
        if x >= Int32.max{
            return Int(Int32.max)
        } else if x <= Int32.min {
            return Int(Int32.min)
        }
        return x
    }
}
