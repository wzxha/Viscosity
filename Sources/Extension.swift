//
//  Extension.swift
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

public extension UIView {
    
    public func vis_makeConstraints(_ closure: (_ maker: Maker) -> Void) -> Void {
        let maker = Maker(view: self)
        closure(maker)
        maker.install(.normal)
    }
    
    public func vis_remakeConstraints(_ closure: (_ maker: Maker) -> Void) -> Void {
        let maker = Maker(view: self)
        closure(maker)
        maker.install(.replace)
    }
    
    public func vis_updateConstraints(_ closure: (_ maker: Maker) -> Void) -> Void {
        let maker = Maker(view: self)
        closure(maker)
        maker.install(.update)
    }
    
    public var vis_left: Constraint {
        return constraint(attribute: .left)
    }

    public var vis_right: Constraint {
        return constraint(attribute: .right)
    }
    
    public var vis_top: Constraint {
        return constraint(attribute: .top)
    }
    
    public var vis_bottom: Constraint {
        return constraint(attribute: .bottom)
    }
    
    public var vis_leading: Constraint {
        return constraint(attribute: .leading)
    }
    
    public var vis_trailing: Constraint {
        return constraint(attribute: .trailing)
    }
    
    public var vis_width: Constraint {
        return constraint(attribute: .width)
    }
    
    public var vis_height: Constraint {
        return constraint(attribute: .height)
    }
    
    public var vis_centerX: Constraint {
        return constraint(attribute: .centerX)
    }
    
    public var vis_centerY: Constraint {
        return constraint(attribute: .centerY)
    }
    
    public var vis_lastBaseline: Constraint {
        return constraint(attribute: .lastBaseline)
    }
    
    @available(iOS 8.0, *)
    public var vis_firstBaseline: Constraint {
        return constraint(attribute: .firstBaseline)
    }
    
    @available(iOS 8.0, *)
    public var vis_leftMargin: Constraint {
        return constraint(attribute: .leftMargin)
    }
    
    @available(iOS 8.0, *)
    public var vis_rightMargin: Constraint {
        return constraint(attribute: .rightMargin)
    }
    
    @available(iOS 8.0, *)
    public var vis_topMargin: Constraint {
        return constraint(attribute: .topMargin)
    }
    
    @available(iOS 8.0, *)
    public var vis_bottomMargin: Constraint {
        return constraint(attribute: .bottomMargin)
    }
    
    @available(iOS 8.0, *)
    public var vis_leadingMargin: Constraint {
        return constraint(attribute: .leadingMargin)
    }
    
    @available(iOS 8.0, *)
    public var vis_trailingMargin: Constraint {
        return constraint(attribute: .trailingMargin)
    }
    
    @available(iOS 8.0, *)
    public var vis_centerXWithinMargins: Constraint {
        return constraint(attribute: .centerXWithinMargins)
    }
    
    @available(iOS 8.0, *)
    public var vis_centerYWithinMargins: Constraint {
        return constraint(attribute: .centerYWithinMargins)
    }
    
    public var vis_center: [Constraint] {
        return [vis_centerX, vis_centerY]
    }
    
    public var vis_edges: [Constraint] {
        return [vis_top, vis_left, vis_bottom, vis_right]
    }
    
    public var vis_size: [Constraint] {
        return [vis_width, vis_height]
    }
    
    private func constraint(attribute: NSLayoutAttribute) -> Constraint {
        let constraint = Constraint(attribute: attribute)
        constraint.toItem = self
        return constraint
    }
}


// MARK: - VisNumeric

public protocol VisNumeric {
    var vis_floatValue: CGFloat { get }
}

extension Int: VisNumeric {
    public var vis_floatValue: CGFloat {
        return CGFloat(self)
    }
}

extension Float: VisNumeric {
    public var vis_floatValue: CGFloat {
        return CGFloat(self)
    }
}

extension Double: VisNumeric {
    public var vis_floatValue: CGFloat {
        return CGFloat(self)
    }
}
extension CGFloat: VisNumeric {
    public var vis_floatValue: CGFloat {
        return self
    }
}

// MARK: - VisStruct

public protocol VisStruct {
    var vis_members: [CGFloat] { get }
}

extension CGPoint: VisStruct {
    public var vis_members: [CGFloat] {
        return [self.x, self.y]
    }
}

extension CGSize: VisStruct {
    public var vis_members: [CGFloat] {
        return [self.width, self.height]
    }
}

extension UIEdgeInsets: VisStruct {
    public var vis_members: [CGFloat] {
        return [self.top, self.left, -self.bottom, -self.right]
    }
}

// MARK: - VisObject

public protocol VisObject {}
extension UIView: VisObject {}
extension Constraint: VisObject {}

