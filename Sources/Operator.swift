//
//  Operator.swift
//  Viscosity
//
//  Created by WzxJiang on 16/7/21.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//
//  https://github.com/Wzxhaha/Viscosity
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


import UIKit

infix operator ~~: VisPriorityPrecedence

precedencegroup VisPriorityPrecedence {
    lowerThan: ComparisonPrecedence
    higherThan: AssignmentPrecedence
}


@discardableResult public func ==(lhs: Constraint, rhs: UIView) -> Constraint {
    lhs.set(view: rhs, relation: .equal)
    return lhs
}

@discardableResult public func ==(lhs: Constraint, rhs: CGFloat) -> Constraint {
    lhs.set(number: rhs, relation: .equal)
    return lhs
}

@discardableResult public func ==(lhs: Constraint, rhs: Constraint) -> Constraint {
    lhs.set(constraint: rhs, relation: .equal)
    return lhs
}

@discardableResult public func >=<T>(lhs: Constraint, rhs: T) -> Constraint {
    switch rhs {
    case is UIView:
        lhs.set(view: rhs as! UIView, relation: .greaterThanOrEqual)
    case is Constraint:
        lhs.set(constraint: rhs as! Constraint, relation: .greaterThanOrEqual)
    case is CGFloat, is Int, is Float:
        lhs.set(number: rhs as! CGFloat, relation: .greaterThanOrEqual)
    default: break
    }
    return lhs
}

@discardableResult public func <=<T>(lhs: Constraint, rhs: T) -> Constraint {
    switch rhs {
    case is UIView:
        lhs.set(view: rhs as! UIView, relation: .lessThanOrEqual)
    case is Constraint:
        lhs.set(constraint: rhs as! Constraint, relation: .lessThanOrEqual)
    case is CGFloat, is Int, is Float:
        lhs.set(number: rhs as! CGFloat, relation: .lessThanOrEqual)
    default: break
    }
    return lhs
}

@discardableResult public func ~~(lhs: Constraint, rhs: CGFloat) -> Constraint {
    lhs.offset(rhs)
    return lhs
}


// MARK: Array

@discardableResult public func ==(lhs: [Constraint], rhs: UIView) -> [Constraint] {
    return lhs.map { $0==rhs }
}

@discardableResult public func ==(lhs: [Constraint], rhs: CGFloat) -> [Constraint] {
    return lhs.map { $0==rhs }
}

@discardableResult public func ==(lhs: [Constraint], rhs: [CGFloat]) -> [Constraint] {
    var index = 0
    return lhs.map { constraint in
        var offset: CGFloat = 0
        if rhs.count > index {
            offset = rhs[index]
        }
        index += 1
        return constraint==offset
    }
}

@discardableResult public func ==(lhs: [Constraint], rhs: CGSize) -> [Constraint] {
    return lhs==[rhs.width, rhs.height]
}

@discardableResult public func ==(lhs: [Constraint], rhs: Constraint) -> [Constraint] {
    return lhs.map { $0==rhs }
}

@discardableResult public func >=<T>(lhs: [Constraint], rhs: T) -> [Constraint] {
    return lhs.map { $0>=rhs }
}

@discardableResult public func <=<T>(lhs: [Constraint], rhs: T) -> [Constraint] {
    return lhs.map { $0<=rhs }
}

@discardableResult public func ~~(lhs: [Constraint], rhs: [CGFloat]) -> [Constraint] {
    var index = 0
    return lhs.map { constraint in
        var offset: CGFloat = 0
        if rhs.count > index {
            offset = rhs[index]
        }
        index += 1
        return constraint~~offset
    }
}

@discardableResult public func ~~(lhs: [Constraint], rhs: CGFloat) -> [Constraint] {
    return lhs~~Array(repeating: rhs, count: lhs.count)
}


