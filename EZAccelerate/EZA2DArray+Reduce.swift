//
//  EZA2DArray+Reduce.swift
//  hehe
//
//  Created by ChuXiaoMin on 2018/10/5.
//  Copyright © 2018 ChuXiaoMin. All rights reserved.
//

import Foundation
import Accelerate

extension EZA2DArray {
    enum SummationType {
        case plain
        case absolute
        case squared
        case signedSquared
    }
    
    enum CompareType {
        case plain
        case magnitude
    }
    
    enum MeanType {
        case plain
        case absolute
        case squared
        case signedSquared
        case rootSquared
    }
    
    func sum(by type: SummationType = .plain) -> Double {
        var rst: Double = 0.0
        switch type {
        case .plain:
            vDSP_sveD(self.content, 1, &rst, vDSP_Length(self.row * self.column))
        case .absolute:
            vDSP_svemgD(self.content, 1, &rst, vDSP_Length(self.row * self.column))
        case .squared:
            vDSP_svesqD(self.content, 1, &rst, vDSP_Length(self.row * self.column))
        case .signedSquared:
            vDSP_svsD(self.content, 1, &rst, vDSP_Length(self.row * self.column))
        }
        return rst
    }
    
    func max(by type: CompareType = .plain) -> Double {
        var rst: Double = 0.0
        switch type {
        case .plain:
            vDSP_maxvD(self.content, 1, &rst, vDSP_Length(self.row * self.column))
        case .magnitude:
            vDSP_maxmgvD(self.content, 1, &rst, vDSP_Length(self.row * self.column))
        }
        return rst
    }
    
    func maxWithIndex(by type: CompareType = .plain) -> (Double, Int) {
        var rst: Double = 0.0
        var ind: vDSP_Length = 0
        switch type {
        case .plain:
            vDSP_maxviD(self.content, 1, &rst, &ind, vDSP_Length(self.row * self.column))
        case .magnitude:
            vDSP_maxmgviD(self.content, 1, &rst, &ind, vDSP_Length(self.row * self.column))
        }
        return (rst, Int(ind))
    }
    
    func min(by type: CompareType = .plain) -> Double {
        var rst: Double = 0.0
        switch type {
        case .plain:
            vDSP_minvD(self.content, 1, &rst, vDSP_Length(self.row * self.column))
        case .magnitude:
            vDSP_minmgvD(self.content, 1, &rst, vDSP_Length(self.row * self.column))
        }
        return rst
    }
    
    func minWithIndex(by type: CompareType = .plain) -> (Double, Int) {
        var rst: Double = 0.0
        var ind: vDSP_Length = 0
        switch type {
        case .plain:
            vDSP_minviD(self.content, 1, &rst, &ind, vDSP_Length(self.row * self.column))
        case .magnitude:
            vDSP_minmgviD(self.content, 1, &rst, &ind, vDSP_Length(self.row * self.column))
        }
        return (rst, Int(ind))
    }
    
    func mean(by type: MeanType = .plain) -> Double {
        var rst: Double = 0.0
        switch type {
        case .plain:
            vDSP_meanvD(self.content, 1, &rst, vDSP_Length(self.row * self.column))
        case .absolute:
            vDSP_meamgvD(self.content, 1, &rst, vDSP_Length(self.row * self.column))
        case .squared:
            vDSP_measqvD(self.content, 1, &rst, vDSP_Length(self.row * self.column))
        case .signedSquared:
            vDSP_mvessqD(self.content, 1, &rst, vDSP_Length(self.row * self.column))
        case .rootSquared:
            vDSP_rmsqvD(self.content, 1, &rst, vDSP_Length(self.row * self.column))
        }
        return rst
    }
}
