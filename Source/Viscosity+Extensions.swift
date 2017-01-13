//
//  Viscosity.swift
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
    
    public func vis_makeConstraints(_ block: (_ maker: VisConstraintMaker) -> Void) -> Void {
        let maker = VisConstraintMaker(view: self, type: .normal)
        block(maker)
        maker.install()
    }
    
    public func vis_remakeConstraints(_ block: (_ maker: VisConstraintMaker) -> Void) -> Void {
        let maker = VisConstraintMaker(view: self, type: .replace)
        block(maker)
        maker.install()
    }
    
    public func vis_updateConstraints(_ block: (_ maker: VisConstraintMaker) -> Void) -> Void {
        let maker = VisConstraintMaker(view: self, type: .update)
        block(maker)
        maker.install()
    }
    
    public var vis_left: VisConstraint {
        get {
            return self.constraint(attribute: .left);
        }
    }

    public var vis_right: VisConstraint {
        get {
            return self.constraint(attribute: .right);
        }
    }
    
    public var vis_top: VisConstraint {
        get {
            return self.constraint(attribute: .top);
        }
    }
    
    public var vis_bottom: VisConstraint {
        get {
            return self.constraint(attribute: .bottom);
        }
    }
    
    public var vis_leading: VisConstraint {
        get {
            return self.constraint(attribute: .leading)
        }
    }
    
    public var vis_trailing: VisConstraint {
        get {
            return self.constraint(attribute: .trailing)
        }
    }
    
    public var vis_width: VisConstraint {
        get {
            return self.constraint(attribute: .width);
        }
    }
    
    public var vis_height: VisConstraint {
        get {
            return self.constraint(attribute: .height);
        }
    }
    
    public var vis_centerX: VisConstraint {
        get {
            return self.constraint(attribute: .centerX);
        }
    }
    
    public var vis_centerY: VisConstraint {
        get {
            return self.constraint(attribute: .centerY);
        }
    }
    
    public var vis_lastBaseline: VisConstraint {
        get {
            return self.constraint(attribute: .lastBaseline)
        }
    }
    
    @available(iOS 8.0, *)
    public var vis_firstBaseline: VisConstraint {
        get {
            return self.constraint(attribute: .firstBaseline)
        }
    }
    
    @available(iOS 8.0, *)
    public var vis_leftMargin: VisConstraint {
        get {
            return self.constraint(attribute: .leftMargin)
        }
    }
    
    @available(iOS 8.0, *)
    public var vis_rightMargin: VisConstraint {
        get {
            return self.constraint(attribute: .rightMargin)
        }
    }
    
    @available(iOS 8.0, *)
    public var vis_topMargin: VisConstraint {
        get {
            return self.constraint(attribute: .topMargin)
        }
    }
    
    @available(iOS 8.0, *)
    public var vis_bottomMargin: VisConstraint {
        get {
            return self.constraint(attribute: .bottomMargin)
        }
    }
    
    @available(iOS 8.0, *)
    public var vis_leadingMargin: VisConstraint {
        get {
            return self.constraint(attribute: .leadingMargin)
        }
    }
    
    @available(iOS 8.0, *)
    public var vis_trailingMargin: VisConstraint {
        get {
            return self.constraint(attribute: .trailingMargin)
        }
    }
    
    @available(iOS 8.0, *)
    public var vis_centerXWithinMargins: VisConstraint {
        get {
            return self.constraint(attribute: .centerXWithinMargins)
        }
    }
    
    @available(iOS 8.0, *)
    public var vis_centerYWithinMargins: VisConstraint {
        get {
            return self.constraint(attribute: .centerYWithinMargins)
        }
    }
    
    public var vis_center: [VisConstraint] {
        get {
            return [self.constraint(attribute: .centerX),
                    self.constraint(attribute: .centerY)]
        }
    }
    
    public var vis_edges: [VisConstraint] {
        get {
            return [self.constraint(attribute: .top),
                    self.constraint(attribute: .left),
                    self.constraint(attribute: .bottom),
                    self.constraint(attribute: .right)]
        }
    }
    
    private func constraint(attribute: NSLayoutAttribute) -> VisConstraint {
        let constraint = VisConstraint(attribute: attribute)
        constraint.toItem = self
        return constraint
    }
}


public extension Array where Element: VisConstraint {
    @discardableResult
    public func equalTo(_ toItem: AnyObject) -> Array {
        for constraint in self {
            constraint.equalTo(toItem)
        }
        return self
    }
    
    @discardableResult
    public func greaterThanOrEqualTo(_ toItem: AnyObject) -> Array {
        for constraint in self {
            constraint.greaterThanOrEqualTo(toItem)
        }
        return self
    }
    
    @discardableResult
    public func lessThanOrEqualTo(_ toItem: AnyObject) -> Array {
        for constraint in self {
            constraint.lessThanOrEqualTo(toItem)
        }
        return self
    }
    
    @discardableResult
    public func multiplier(_ multiplier: CGFloat) -> Array {
        for constraint in self {
            constraint.multiplier(multiplier)
        }
        return self
    }
    
    @discardableResult
    public func point(_ point: CGPoint) -> Array {
        for (index, offset) in
            [point.x, point.y].enumerated() {
            guard self.count > index else {
                break
            }
            self[index].offset(offset)
        }
        return self
    }
    
    @discardableResult
    public func edge(_ edge: UIEdgeInsets) -> Array {
        for (index, offset) in
            [edge.top, edge.left, edge.bottom, edge.right].enumerated() {
            guard self.count > index else {
                break
            }
            self[index].offset(offset)
        }
        return self
    }
    
    @discardableResult
    public func offsets(_ offsets: [CGFloat]) -> Array {
        for (index, constraint) in self.enumerated() {
            var offset: CGFloat = 0
            
            if offsets.count > index {
                offset = offsets[index]
            }
            
            constraint.offset(offset)
        }
        return self
    }
}
