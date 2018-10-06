//
//  EZA2DArray+Arithmetic.swift
//  EZAccelerate
//
//  Created by ChuXiaoMin on 2018/10/4.
//  Copyright © 2018 ChuXiaoMin. All rights reserved.
//

import Foundation
import Accelerate

extension EZA2DArray {
    static func +(lhs: EZA2DArray, rhs: EZA2DArray) -> EZA2DArray {
        var rst = EZA2DArray(row: lhs.row, column: lhs.column)
        vDSP_vaddD(lhs.content, 1, rhs.content, 1, &rst.content, 1, vDSP_Length(lhs.row*lhs.column))
        return rst
    }
    
    static func -(lhs: EZA2DArray, rhs: EZA2DArray) -> EZA2DArray {
        var rst = EZA2DArray(row: lhs.row, column: lhs.column)
        vDSP_vsubD(rhs.content, 1, lhs.content, 1, &rst.content, 1, vDSP_Length(lhs.row*lhs.column))
        return rst
    }
    
    static func pointWiseProduct(lhs: EZA2DArray, rhs: EZA2DArray) -> EZA2DArray {
        var rst = EZA2DArray(row: lhs.row, column: lhs.column)
        vDSP_vmulD(lhs.content, 1, rhs.content, 1, &rst.content, 1, vDSP_Length(lhs.row*lhs.column))
        return rst
    }
    
    static func *(lhs: EZA2DArray, rhs: Double) -> EZA2DArray {
        var rst = EZA2DArray(row: lhs.row, column: lhs.column)
        var oprand = rhs
        vDSP_vsmulD(lhs.content, 1, &oprand, &rst.content, 1, vDSP_Length(lhs.row*lhs.column))
        return rst
    }
    
    static func *(lhs: Double, rhs: EZA2DArray) -> EZA2DArray {
        var rst = EZA2DArray(row: rhs.row, column: rhs.column)
        var oprand = lhs
        vDSP_vsmulD(rhs.content, 1, &oprand, &rst.content, 1, vDSP_Length(rhs.row*rhs.column))
        return rst
    }
    
    static func *(lhs: EZA2DArray, rhs: EZA2DArray) -> EZA2DArray {
        var rst = EZA2DArray(row: lhs.row, column: rhs.column)
        if !lhs.transposed {
            if !rhs.transposed {
                cblas_dgemm(CBLAS_ORDER(UInt32(102)), CBLAS_TRANSPOSE(UInt32(111)), CBLAS_TRANSPOSE(UInt32(111)), Int32(lhs.row), Int32(rhs.column), Int32(lhs.column), 1, lhs.content, Int32(lhs.row), rhs.content, Int32(rhs.row), 1, &rst.content, Int32(rst.row))
            } else {
                cblas_dgemm(CBLAS_ORDER(UInt32(102)), CBLAS_TRANSPOSE(UInt32(111)), CBLAS_TRANSPOSE(UInt32(112)), Int32(lhs.row), Int32(rhs.column), Int32(lhs.column), 1, lhs.content, Int32(lhs.row), rhs.content, Int32(rhs.column), 1, &rst.content, Int32(rst.row))
            }
        } else {
            if !rhs.transposed {
                cblas_dgemm(CBLAS_ORDER(UInt32(102)), CBLAS_TRANSPOSE(UInt32(112)), CBLAS_TRANSPOSE(UInt32(111)), Int32(lhs.row), Int32(rhs.column), Int32(lhs.column), 1, lhs.content, Int32(lhs.column), rhs.content, Int32(rhs.row), 1, &rst.content, Int32(rst.row))
            } else {
                cblas_dgemm(CBLAS_ORDER(UInt32(102)), CBLAS_TRANSPOSE(UInt32(112)), CBLAS_TRANSPOSE(UInt32(112)), Int32(lhs.row), Int32(rhs.column), Int32(lhs.column), 1, lhs.content, Int32(lhs.column), rhs.content, Int32(rhs.column), 1, &rst.content, Int32(rst.row))
            }
        }
        return rst
    }
}
