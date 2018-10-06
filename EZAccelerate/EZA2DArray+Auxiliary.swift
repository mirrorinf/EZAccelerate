//
//  EZA2DArray+Auxiliary.swift
//  hehe
//
//  Created by ChuXiaoMin on 2018/10/5.
//  Copyright © 2018 ChuXiaoMin. All rights reserved.
//

import Foundation
import Accelerate

extension EZA2DArray {
    mutating func fill(with value: Double, each stride: Int = 1) {
        var s = value
        vDSP_vfillD(&s, &self.content, stride, vDSP_Length(self.row * self.column / stride))
    }
    
    static func ramped(from initi: Double, by incr: Double, of size: Int, as type: Shape = .column) -> EZA2DArray {
        var rst: EZA2DArray
        var A = initi
        var B = incr
        switch type {
        case .row:
            rst = EZA2DArray(row: 1, column: size)
        case .column:
            rst = EZA2DArray(row: size, column: 1)
        }
        vDSP_vrampD(&A, &B, &rst.content, 1, vDSP_Length(size))
        return rst
    }
    
    static func ramped(from initi: Double, to dest: Double, of size: Int, as type: Shape = .column) -> EZA2DArray {
        var rst: EZA2DArray
        var A = initi
        var B = dest
        switch type {
        case .row:
            rst = EZA2DArray(row: 1, column: size)
        case .column:
            rst = EZA2DArray(row: size, column: 1)
        }
        vDSP_vgenD(&A, &B, &rst.content, 1, vDSP_Length(size))
        return rst
    }
}
