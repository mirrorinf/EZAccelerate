//
//  ODESolver.swift
//  EZAccelerate
//
//  Created by ChuXiaoMin on 2018/11/5.
//  Copyright © 2018 ChuXiaoMin. All rights reserved.
//

import Foundation

protocol EZAODESystem {
    associatedtype Representation: EZAArray
    var initialValue: Representation { get }
    var initialTime: Representation.Base { get }
    var derivative: (Representation, Representation.Base) -> Representation { get }
}

class EZAODESolver<T: EZAODESystem> {
    var currentValue: T.Representation
    var currentTime: T.Representation.Base
    var derivative: (T.Representation, T.Representation.Base) -> T.Representation
    
    init(of: T) {
        derivative = of.derivative
        currentTime = of.initialTime
        currentValue = of.initialValue
    }
    
    func update(by step: T.Representation.Base) {
        fatalError("Do not use EZAODESolver base class. Use a specific solver instead.")
    }
    
    func batch(by step: T.Representation.Base, run: Int) -> [T.Representation] {
        var rst: [T.Representation] = []
        
        for _ in 0..<run {
            rst.append(currentValue)
            self.update(by: step)
        }
        
        return rst
    }
    
    func batchNoReturn(by step: T.Representation.Base, run: Int) {        
        for _ in 0..<run {
            self.update(by: step)
        }
    }
}
