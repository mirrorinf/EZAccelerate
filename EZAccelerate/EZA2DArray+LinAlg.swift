//
//  EZA2DArray+LinAlg.swift
//  hehe
//
//  Created by ChuXiaoMin on 2018/10/4.
//  Copyright © 2018 ChuXiaoMin. All rights reserved.
//

import Foundation
import Accelerate

extension EZA2DArray {
    mutating func prepareForLAPACK() {
        if self.transposed {
            let temp = self.content
            vDSP_mtransD(temp, 1, &self.content, 1, vDSP_Length(self.column), vDSP_Length(self.row))
            self.transposed = false
        }
    }
    
    func solve(rhs: EZA2DArray) -> EZA2DArray {
        guard self.row == self.column else {
            fatalError("Not yet implemented")
        }
        guard !self.transposed else {
            fatalError("matrix not compatible with LAPACK use")
        }
        
        var n = Int32(self.row)
        var lda = n, ldb = n
        var nrhs = Int32(1)
        var temp = self.content
        var ipiv = [Int32](repeating: 0, count: self.row)
        var ans = rhs
        var uinfo: Int32 = 0
        dgesv_(&n, &nrhs, &temp, &lda, &ipiv, &ans.content, &ldb, &uinfo)
        return ans
    }
    
    var rank: Int {
        guard !self.transposed else {
            fatalError("matrix not compatible with LAPACK use")
        }
        
        var jobu = Int8(78)
        var jobvt = Int8(78)
        var M = Int32(self.row)
        var N = Int32(self.column)
        var temp = self.content
        var lda = M
        var s = [Double](repeating: 0, count: Int(Swift.min(M, N)))
        var ldu = Int32(1)
        var ldvt = Int32(1)
        var work = [Double](repeating: 0, count: Int(5*Swift.min(M, N)))
        var lwork = 5*Swift.min(M, N)
        var info: Int32 = 0
        dgesvd_(&jobu, &jobvt, &M, &N, &temp, &lda, &s, nil, &ldu, nil, &ldvt, &work, &lwork, &info)
        
        var ans: Int = 0
        for i in s {
            if fabs(i) > 1e-5 {
                ans += 1
            }
        }
        
        return ans
    }
    
    var singularValues: [Double] {
        guard !self.transposed else {
            fatalError("matrix not compatible with LAPACK use")
        }
        
        var jobu = Int8(78)
        var jobvt = Int8(78)
        var M = Int32(self.row)
        var N = Int32(self.column)
        var temp = self.content
        var lda = M
        var s = [Double](repeating: 0, count: Int(Swift.min(M, N)))
        var ldu = Int32(1)
        var ldvt = Int32(1)
        var work = [Double](repeating: 0, count: Int(5*Swift.min(M, N)))
        var lwork = 5*Swift.min(M, N)
        var info: Int32 = 0
        dgesvd_(&jobu, &jobvt, &M, &N, &temp, &lda, &s, nil, &ldu, nil, &ldvt, &work, &lwork, &info)
        
        let ans = s.filter {fabs($0) > 1e-5}
        
        return ans
    }
    
    var inverse: EZA2DArray {
        guard self.row == self.column else {
            fatalError("Impossible")
        }
        guard !self.transposed else {
            fatalError("matrix not compatible with LAPACK use")
        }
        
        var M = Int32(self.row)
        var N = Int32(self.column)
        var lda = Int32(self.row)
        var ipiv = [Int32](repeating: 0, count: self.row)
        var info = Int32(0)
        var temp = self
        var lwork = Int32(4)*N
        var work = [Double](repeating: 0, count: Int(lwork))
        
        dgetrf_(&M, &N, &temp.content, &lda, &ipiv, &info)
        dgetri_(&M, &temp.content, &lda, &ipiv, &work, &lwork, &info)
        
        return temp
    }
    
    var tr: Double {
        var rst: Double = 0.0
        vDSP_sveD(self.content, self.row + 1, &rst, vDSP_Length(Swift.min(self.row, self.column)))
        return rst
    }
}
