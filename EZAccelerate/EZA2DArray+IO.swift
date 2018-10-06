//
//  EZA2DArray+IO.swift
//  hehe
//

import Foundation

extension EZA2DArray: CustomStringConvertible {
    var description: String {
        var str = ""
        for i in 0..<row {
            for j in 0..<column {
                str += "\(self[i, j]), "
            }
            str += "\n"
        }
        return str
    }
}

extension EZA2DArray: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: [Double]...) {
        row = elements[0].count
        column = elements.count
        transposed = false
        content = elements.flatMap{$0}
    }
}
