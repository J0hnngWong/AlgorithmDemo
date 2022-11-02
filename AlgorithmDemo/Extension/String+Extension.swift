//
//  String+Extension.swift
//  AlgorithmDemo
//
//  Created by john on 2022/11/2.
//  Copyright © 2022 王嘉宁. All rights reserved.
//

import Foundation

extension String {
    func subString(from: Int, to: Int) -> String {
        if from < to {
            let startIndex = self.index(self.startIndex, offsetBy: from)
            let endIndex = self.index(self.startIndex, offsetBy: to)
            return String(self[startIndex...endIndex])
        }
        if from == to {
            let startIndex = self.index(self.startIndex, offsetBy: from)
            return String(self[startIndex])
        }
        return ""
    }
    
    func indexByInt(position: Int) -> String.Element {
        return self[self.index(self.startIndex, offsetBy: position)]
    }
    
    func character(at index: Int) -> String.Element {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
