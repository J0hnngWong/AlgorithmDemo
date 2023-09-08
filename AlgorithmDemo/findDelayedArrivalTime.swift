//
//  findDelayedArrivalTime.swift
//  AlgorithmDemo
//
//  Created by Johnny on 9/8/23.
//  Copyright © 2023 王嘉宁. All rights reserved.
//

import Foundation

extension Solution {
    func findDelayedArrivalTime(_ arrivalTime: Int, _ delayedTime: Int) -> Int {
        (arrivalTime + delayedTime) % 24
    }
}
