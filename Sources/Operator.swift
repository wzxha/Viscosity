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

// low -> high
infix operator ~|: AssignmentPrecedence
infix operator ~~: TernaryPrecedence
infix operator +~: LogicalDisjunctionPrecedence
infix operator *~: LogicalConjunctionPrecedence

// MARK: - Constraint ==

@discardableResult public func == <O: VisObject>(lhs: Constraint, rhs: O) -> Constraint {
    lhs.set(object: rhs, relation: .equal)
    return lhs
}

@discardableResult public func == <N: VisNumeric>(lhs: Constraint, rhs: N) -> Constraint {
    lhs.set(number: rhs, relation: .equal)
    return lhs
}


// MARK: - Constraint >=

@discardableResult public func >= <O: VisObject>(lhs: Constraint, rhs: O) -> Constraint {
    lhs.set(object: rhs, relation: .greaterThanOrEqual)
    return lhs
}

@discardableResult public func >= <N: VisNumeric>(lhs: Constraint, rhs: N) -> Constraint {
    lhs.set(number: rhs, relation: .greaterThanOrEqual)
    return lhs
}


// MARK: - Constraint <=

@discardableResult public func <= <O: VisObject>(lhs: Constraint, rhs: O) -> Constraint {
    lhs.set(object: rhs, relation: .lessThanOrEqual)
    return lhs
}

@discardableResult public func <= <N: VisNumeric>(lhs: Constraint, rhs: N) -> Constraint {
    lhs.set(number: rhs, relation: .lessThanOrEqual)
    return lhs
}


// MARK: - [Constraint] ==

@discardableResult public func == <O: VisObject>(lhs: [Constraint], rhs: O) -> [Constraint] {
    return lhs.map { $0 == rhs }
}

@discardableResult public func == <N: VisNumeric>(lhs: [Constraint], rhs: N) -> [Constraint] {
    return lhs.map { $0 == rhs }
}

@discardableResult public func == <S: VisStruct>(lhs: [Constraint], rhs: S) -> [Constraint] {
    return lhs == rhs.vis_members
}

@discardableResult public func == <N: VisNumeric>(lhs: [Constraint], rhs: [N]) -> [Constraint] {
    var index = 0
    return lhs.map { constraint in
        assert(rhs.count > index, "\(rhs).count must more than \(lhs).count")
        constraint == rhs[index]
        index += 1
        return constraint
    }
}


// MARK: - [Constraint] >=

@discardableResult public func >= <O: VisObject>(lhs: [Constraint], rhs: O) -> [Constraint] {
    return lhs.map { $0 >= rhs }
}

@discardableResult public func >= <N: VisNumeric>(lhs: [Constraint], rhs: N) -> [Constraint] {
    return lhs.map { $0 >= rhs }
}

@discardableResult public func >= <S: VisStruct>(lhs: [Constraint], rhs: S) -> [Constraint] {
    return lhs >= rhs.vis_members
}

@discardableResult public func >= <N: VisNumeric>(lhs: [Constraint], rhs: [N]) -> [Constraint] {
    var index = 0
    return lhs.map { constraint in
        assert(rhs.count > index, "\(rhs).count must more than \(lhs).count")
        constraint >= rhs[index]
        index += 1
        return constraint
    }
}


// MARK: - [Constraint] <=

@discardableResult public func <= <O: VisObject>(lhs: [Constraint], rhs: O) -> [Constraint] {
    return lhs.map { $0 <= rhs }
}

@discardableResult public func <= <N: VisNumeric>(lhs: [Constraint], rhs: N) -> [Constraint] {
    return lhs.map { $0 <= rhs }
}

@discardableResult public func <= <S: VisStruct>(lhs: [Constraint], rhs: S) -> [Constraint] {
    return lhs <= rhs.vis_members
}

@discardableResult public func <= <N: VisNumeric>(lhs: [Constraint], rhs: [N]) -> [Constraint] {
    var index = 0
    return lhs.map { constraint in
        assert(rhs.count > index, "\(rhs).count must more than \(lhs).count")
        constraint <= rhs[index]
        index += 1
        return constraint
    }
}

// MARK: - + 

@discardableResult public func +~ <N: VisNumeric>(lhs: Constraint, rhs: N) -> Constraint {
    return lhs.offset(rhs)
}

@discardableResult public func +~ <N: VisNumeric>(lhs: [Constraint], rhs: N) -> [Constraint] {
    return lhs.map { $0.offset(rhs) }
}

@discardableResult public func +~ <S: VisStruct>(lhs: [Constraint], rhs: S) -> [Constraint] {
    return lhs +~ rhs.vis_members
}

@discardableResult public func +~ <N: VisNumeric>(lhs: [Constraint], rhs: [N]) -> [Constraint] {
    var index = 0
    return lhs.map { constraint in
        assert(rhs.count > index, "\(rhs).count must more than \(lhs).count")
        constraint.offset(rhs[index])
        index += 1
        return constraint
    }
}


// MARK: - *

@discardableResult public func *~ <N: VisNumeric>(lhs: Constraint, rhs: N) -> Constraint {
    return lhs.multiplier(rhs)
}

@discardableResult public func *~ <N: VisNumeric>(lhs: [Constraint], rhs: N) -> [Constraint] {
    return lhs.map { $0.multiplier(rhs) }
}

@discardableResult public func *~ <S: VisStruct>(lhs: [Constraint], rhs: S) -> [Constraint] {
    return lhs *~ rhs.vis_members
}

@discardableResult public func *~ <N: VisNumeric>(lhs: [Constraint], rhs: [N]) -> [Constraint] {
    var index = 0
    return lhs.map { constraint in
        assert(rhs.count > index, "\(rhs).count must more than \(lhs).count")
        constraint.multiplier(rhs[index])
        index += 1
        return constraint
    }
}


// MARK: - priority

@discardableResult public func ~~(lhs: Constraint, rhs: UILayoutPriority) -> Constraint {
    return lhs.priority(rhs)
}

@discardableResult public func ~~(lhs: [Constraint], rhs: UILayoutPriority) -> [Constraint] {
    return lhs.map { $0.priority(rhs) }
}


// MARK: - isActive

@discardableResult public func ~|(lhs: Constraint, rhs: Bool) -> Constraint {
    return lhs.isActive(rhs)
}

@discardableResult public func ~|(lhs: [Constraint], rhs: Bool) -> [Constraint] {
    return lhs.map { $0.isActive(rhs) }
}











