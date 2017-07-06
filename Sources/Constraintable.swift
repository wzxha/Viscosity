//
//  Constraintable.swift
//  Viscosity
//
//  Created by WzxJiang on 17/7/6.
//  Copyright © 2017年 WzxJiang. All rights reserved.
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

public protocol Constraintable: class {
    var left: Constraint { get }
    
    var right: Constraint { get }
    
    var top: Constraint { get }
    
    var bottom: Constraint { get }
    
    var leading: Constraint { get }
    
    var trailing: Constraint { get }
    
    var width: Constraint { get }
    
    var height: Constraint { get }
    
    var centerX: Constraint { get }
    
    var centerY: Constraint { get }
    
    var lastBaseline: Constraint { get }
    
    @available(iOS 8.0, *)
    var firstBaseline: Constraint { get }
    
    @available(iOS 8.0, *)
    var leftMargin: Constraint { get }
    
    @available(iOS 8.0, *)
    var rightMargin: Constraint { get }
    
    @available(iOS 8.0, *)
    var topMargin: Constraint { get }
    
    @available(iOS 8.0, *)
    var bottomMargin: Constraint { get }
    
    @available(iOS 8.0, *)
    var leadingMargin: Constraint { get }
    
    @available(iOS 8.0, *)
    var trailingMargin: Constraint { get }
    
    @available(iOS 8.0, *)
    var centerXWithinMargins: Constraint { get }
    
    @available(iOS 8.0, *)
    var centerYWithinMargins: Constraint { get }
    
    var center: [Constraint] { get }
    
    var edges: [Constraint] { get }
    
    var size: [Constraint] { get }
    
    func constraint(withAttribute attribute: NSLayoutAttribute) -> Constraint
}

public extension Constraintable {
    var left: Constraint {
        return constraint(withAttribute: .left)
    }
    
    var right: Constraint {
        return constraint(withAttribute: .right)
    }
    
    var top: Constraint {
        return constraint(withAttribute: .top)
    }
    
    var bottom: Constraint {
        return constraint(withAttribute: .bottom)
    }
    
    var leading: Constraint {
        return constraint(withAttribute: .leading)
    }
    
    var trailing: Constraint {
        return constraint(withAttribute: .trailing)
    }
    
    var width: Constraint {
        return constraint(withAttribute: .width)
    }
    
    var height: Constraint {
        return constraint(withAttribute: .height)
    }
    
    var centerX: Constraint {
        return constraint(withAttribute: .centerX)
    }
    
    var centerY: Constraint {
        return constraint(withAttribute: .centerY)
    }
    
    var lastBaseline: Constraint {
        return constraint(withAttribute: .lastBaseline)
    }
    
    @available(iOS 8.0, *)
    var firstBaseline: Constraint {
        return constraint(withAttribute: .firstBaseline)
    }
    
    @available(iOS 8.0, *)
    var leftMargin: Constraint {
        return constraint(withAttribute: .leftMargin)
    }
    
    @available(iOS 8.0, *)
    var rightMargin: Constraint {
        return constraint(withAttribute: .rightMargin)
    }
    
    @available(iOS 8.0, *)
    var topMargin: Constraint {
        return constraint(withAttribute: .topMargin)
    }
    
    @available(iOS 8.0, *)
    var bottomMargin: Constraint {
        return constraint(withAttribute: .bottomMargin)
    }
    
    @available(iOS 8.0, *)
    public var leadingMargin: Constraint {
        return constraint(withAttribute: .leadingMargin)
    }
    
    @available(iOS 8.0, *)
    var trailingMargin: Constraint {
        return constraint(withAttribute: .trailingMargin)
    }
    
    @available(iOS 8.0, *)
    var centerXWithinMargins: Constraint {
        return constraint(withAttribute: .centerXWithinMargins)
    }
    
    @available(iOS 8.0, *)
    var centerYWithinMargins: Constraint {
        return constraint(withAttribute: .centerYWithinMargins)
    }
    
    var center: [Constraint] {
        return [centerX, centerY]
    }
    
    var edges: [Constraint] {
        return [top, left, bottom, right]
    }
    
    var size: [Constraint] {
        return [width, height]
    }
}

extension Manager: Constraintable {
    public func constraint(withAttribute attribute: NSLayoutAttribute) -> Constraint {
        let constraint = Constraint(attribute: attribute)
        constraint.toItem = view
        constraints.append(constraint)
        return constraint
    }
}

extension Maker: Constraintable {
    public func constraint(withAttribute attribute: NSLayoutAttribute) -> Constraint {
        let constraint = Constraint(attribute: attribute)
        constraint.toItem = view
        constraints.append(constraint)
        return constraint
    }
}
