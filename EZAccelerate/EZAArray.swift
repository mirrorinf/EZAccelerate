//
//  EZAArray.swift
//  EZAccelerate
//
//  Created by ChuXiaoMin on 2018/11/5.
//  Copyright © 2018 ChuXiaoMin. All rights reserved.
//

import Foundation

protocol EZAArray: Equatable {
    associatedtype Base: FloatingPoint
    
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Base) -> Self
    static func *(lhs: Base, rhs: Self) -> Self
}
