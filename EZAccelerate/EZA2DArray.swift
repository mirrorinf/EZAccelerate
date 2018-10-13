//
//  EZA2DArray.swift
//  EZAccelerate
//

import Foundation
import Accelerate

// column major
struct EZA2DArray {
    var content: [Double]
    var row, column: Int
    internal var transposed: Bool
}

extension EZA2DArray {
    subscript(i: Int, j: Int) -> Double{
        get {
            if !transposed {
                return content[j*row + i]
            } else {
                return content[i*column + j]
            }
        }
        set {
            if !transposed {
                content[j*row + i] = newValue
            } else {
                content[i*column + j] = newValue
            }
        }
    }
}

extension EZA2DArray {
    enum Shape {
        case row
        case column
    }
    
    init(row r: Int, column c: Int) {
        row = r
        column = c
        content = [Double](repeating: 0, count: r*c)
        transposed = false
    }
    
    static func identity(order n: Int) -> EZA2DArray {
        var raw = EZA2DArray(row: n, column: n)
        var set: Double = 1
        vDSP_vfillD(&set, &raw.content, n+1, vDSP_Length(n))
        return raw
    }
    
    mutating func transpose() {
        self.transposed = !transposed
        let temp = self.row
        self.row = self.column
        self.column = temp
    }
}

extension EZA2DArray: Equatable {
    
}

extension EZA2DArray: Hashable {
    
}
