//
//  EZA2DArray+Pointwise.swift
//  hehe
//

import Foundation
import Accelerate

extension EZA2DArray {
    var ceil: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvceil(&rst.content, self.content, &size)
        return rst
    }
    
    var floor: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvfloor(&rst.content, self.content, &size)
        return rst
    }
    
    var nint: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvnint(&rst.content, self.content, &size)
        return rst
    }
    
    var abs: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvfabs(&rst.content, self.content, &size)
        return rst
    }
    
    var recip: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvrec(&rst.content, self.content, &size)
        return rst
    }
    
    var sqrt: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvsqrt(&rst.content, self.content, &size)
        return rst
    }
    
    var exp: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvexp(&rst.content, self.content, &size)
        return rst
    }
    
    var exp2: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvexp2(&rst.content, self.content, &size)
        return rst
    }
    
    var expm1: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvexpm1(&rst.content, self.content, &size)
        return rst
    }
    
    var log: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvlog(&rst.content, self.content, &size)
        return rst
    }
    
    var log1p: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvlog1p(&rst.content, self.content, &size)
        return rst
    }
    
    var log2: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvlog2(&rst.content, self.content, &size)
        return rst
    }
    
    var log10: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvlog10(&rst.content, self.content, &size)
        return rst
    }
    
    var sin: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvsin(&rst.content, self.content, &size)
        return rst
    }
    
    var asin: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvasin(&rst.content, self.content, &size)
        return rst
    }
    
    var cos: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvcos(&rst.content, self.content, &size)
        return rst
    }
    
    var acos: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvacos(&rst.content, self.content, &size)
        return rst
    }
    
    var tan: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvtan(&rst.content, self.content, &size)
        return rst
    }
    
    var atan: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvatan(&rst.content, self.content, &size)
        return rst
    }
    
    var sinh: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvsinh(&rst.content, self.content, &size)
        return rst
    }
    
    var asinh: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvasinh(&rst.content, self.content, &size)
        return rst
    }
    
    var cosh: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvcosh(&rst.content, self.content, &size)
        return rst
    }
    
    var acosh: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvacosh(&rst.content, self.content, &size)
        return rst
    }
    
    var tanh: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvtanh(&rst.content, self.content, &size)
        return rst
    }
    
    var atanh: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvatanh(&rst.content, self.content, &size)
        return rst
    }
    
    var sinpi: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvsinpi(&rst.content, self.content, &size)
        return rst
    }
    
    var cospi: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvcospi(&rst.content, self.content, &size)
        return rst
    }
    
    var tanpi: EZA2DArray {
        var rst = self
        var size = Int32(self.row * self.column)
        vvtanpi(&rst.content, self.content, &size)
        return rst
    }
}
