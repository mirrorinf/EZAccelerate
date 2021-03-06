//
//  EZARK45ODESolver.swift
//  EZAccelerate
//
//  Created by ChuXiaoMin on 2018/11/5.
//  Copyright © 2018 ChuXiaoMin. All rights reserved.
//

import Foundation

class EZARK45ODESolver<T: EZAODESystem>: EZAStepODESolver<T> {
    override func update(by step: T.Representation.Base) {
        let half = T.Representation.Base(1) / T.Representation.Base(2)
        let k1 = step * derivative(currentValue, currentTime)
        let k2 = step * derivative(currentValue + k1*half, currentTime + step*half)
        let k3 = step * derivative(currentValue + k2*half, currentTime + step*half)
        let k4 = step * derivative(currentValue + k3, currentTime + step)
        
        let onesixth = T.Representation.Base(1) / T.Representation.Base(6)
        let two = T.Representation.Base(2)
        
        currentTime = currentTime + step
        
        let add1 = k1 + two * k2
        let add2 = two * k3 + k4
        let add3 = add1 * onesixth + add2 * onesixth
        currentValue = currentValue + add3
    }
}
