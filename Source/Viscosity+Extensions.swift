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
    
    public func vis_makeConstraints(_ closure: (_ maker: VisConstraintMaker) -> Void) -> Void {
        let maker = VisConstraintMaker(view: self, type: .normal)
        closure(maker)
        maker.install()
    }
    
    public func vis_remakeConstraints(_ closure: (_ maker: VisConstraintMaker) -> Void) -> Void {
        let maker = VisConstraintMaker(view: self, type: .replace)
        closure(maker)
        maker.install()
    }
    
    public func vis_updateConstraints(_ closure: (_ maker: VisConstraintMaker) -> Void) -> Void {
        let maker = VisConstraintMaker(view: self, type: .update)
        closure(maker)
        maker.install()
    }
    
    public var vis_left: VisConstraint {
        return constraint(attribute: .left)
    }

    public var vis_right: VisConstraint {
        return constraint(attribute: .right)
    }
    
    public var vis_top: VisConstraint {
        return constraint(attribute: .top)
    }
    
    public var vis_bottom: VisConstraint {
        return constraint(attribute: .bottom)
    }
    
    public var vis_leading: VisConstraint {
        return constraint(attribute: .leading)
    }
    
    public var vis_trailing: VisConstraint {
        return constraint(attribute: .trailing)
    }
    
    public var vis_width: VisConstraint {
        return constraint(attribute: .width)
    }
    
    public var vis_height: VisConstraint {
        return constraint(attribute: .height)
    }
    
    public var vis_centerX: VisConstraint {
        return constraint(attribute: .centerX)
    }
    
    public var vis_centerY: VisConstraint {
        return constraint(attribute: .centerY)
    }
    
    public var vis_lastBaseline: VisConstraint {
        return constraint(attribute: .lastBaseline)
    }
    
    @available(iOS 8.0, *)
    public var vis_firstBaseline: VisConstraint {
        return constraint(attribute: .firstBaseline)
    }
    
    @available(iOS 8.0, *)
    public var vis_leftMargin: VisConstraint {
        return constraint(attribute: .leftMargin)
    }
    
    @available(iOS 8.0, *)
    public var vis_rightMargin: VisConstraint {
        return constraint(attribute: .rightMargin)
    }
    
    @available(iOS 8.0, *)
    public var vis_topMargin: VisConstraint {
        return constraint(attribute: .topMargin)
    }
    
    @available(iOS 8.0, *)
    public var vis_bottomMargin: VisConstraint {
        return constraint(attribute: .bottomMargin)
    }
    
    @available(iOS 8.0, *)
    public var vis_leadingMargin: VisConstraint {
        return constraint(attribute: .leadingMargin)
    }
    
    @available(iOS 8.0, *)
    public var vis_trailingMargin: VisConstraint {
        return constraint(attribute: .trailingMargin)
    }
    
    @available(iOS 8.0, *)
    public var vis_centerXWithinMargins: VisConstraint {
        return constraint(attribute: .centerXWithinMargins)
    }
    
    @available(iOS 8.0, *)
    public var vis_centerYWithinMargins: VisConstraint {
        return constraint(attribute: .centerYWithinMargins)
    }
    
    public var vis_center: [VisConstraint] {
        return [vis_centerX, vis_centerY]
    }
    
    public var vis_edges: [VisConstraint] {
        return [vis_top, vis_left, vis_bottom, vis_right]
    }
    
    public var vis_size: [VisConstraint] {
        return [vis_width, vis_height]
    }
    
    private func constraint(attribute: NSLayoutAttribute) -> VisConstraint {
        let constraint = VisConstraint(attribute: attribute)
        constraint.toItem = self
        return constraint
    }
}

public extension Array where Element: VisConstraint {
    
    // MARK: - equal
    @discardableResult
    public func equalTo(_ item: UIView) -> [VisConstraint] {
        for constraint in self {
            constraint.equalTo(item)
        }
        return self
    }
    
    @discardableResult
    public func equalTo(_ item: CGFloat) -> [VisConstraint] {
        for constraint in self {
            constraint.equalTo(item)
        }
        return self
    }
    
    @discardableResult
    public func equalTo(_ item: VisConstraint) -> [VisConstraint] {
        for constraint in self {
            constraint.equalTo(item)
        }
        return self
    }
    
    @discardableResult
    public func equalTo(_ item: CGSize) -> [VisConstraint] {
        for (index, offset) in [item.width, item.height].enumerated() {
            guard self.count > index else {
                break
            }
            self[index].equalTo(offset)
        }
        return self
    }
    
    @discardableResult
    public func equalTo(_ item: CGPoint) -> [VisConstraint] {
        for (index, offset) in [item.x, item.y].enumerated() {
            guard self.count > index else {
                break
            }
            self[index].equalTo(offset)
        }
        return self
    }
    
    // MARK: - greater than or equal
    @discardableResult
    public func greaterThanOrEqualTo(_ item: UIView) -> [VisConstraint] {
        for constraint in self {
            constraint.greaterThanOrEqualTo(item)
        }
        return self
    }
    
    @discardableResult
    public func greaterThanOrEqualTo(_ item: CGFloat) -> [VisConstraint] {
        for constraint in self {
            constraint.greaterThanOrEqualTo(item)
        }
        return self
    }
    
    @discardableResult
    public func greaterThanOrEqualTo(_ item: VisConstraint) -> [VisConstraint] {
        for constraint in self {
            constraint.greaterThanOrEqualTo(item)
        }
        return self
    }
    
    @discardableResult
    public func greaterThanOrEqualTo(_ item: CGSize) -> [VisConstraint] {
        for (index, offset) in [item.width, item.height].enumerated() {
            guard self.count > index else {
                break
            }
            self[index].greaterThanOrEqualTo(offset)
        }
        return self
    }
    
    @discardableResult
    public func greaterThanOrEqualTo(_ item: CGPoint) -> [VisConstraint] {
        for (index, offset) in [item.x, item.y].enumerated() {
            guard self.count > index else {
                break
            }
            self[index].greaterThanOrEqualTo(offset)
        }
        return self
    }
    
    // MARK: - less than or equal
    @discardableResult
    public func lessThanOrEqualTo(_ item: UIView) -> [VisConstraint] {
        for constraint in self {
            constraint.lessThanOrEqualTo(item)
        }
        return self
    }
    
    @discardableResult
    public func lessThanOrEqualTo(_ item: CGFloat) -> [VisConstraint] {
        for constraint in self {
            constraint.lessThanOrEqualTo(item)
        }
        return self
    }
    
    @discardableResult
    public func lessThanOrEqualTo(_ item: VisConstraint) -> [VisConstraint] {
        for constraint in self {
            constraint.lessThanOrEqualTo(item)
        }
        return self
    }
    
    @discardableResult
    public func lessThanOrEqualTo(_ item: CGSize) -> [VisConstraint] {
        for (index, offset) in [item.width, item.height].enumerated() {
            guard self.count > index else {
                break
            }
            self[index].lessThanOrEqualTo(offset)
        }
        return self
    }
    
    @discardableResult
    public func lessThanOrEqualTo(_ item: CGPoint) -> [VisConstraint] {
        for (index, offset) in [item.x, item.y].enumerated() {
            guard self.count > index else {
                break
            }
            self[index].lessThanOrEqualTo(offset)
        }
        return self
    }
    
    // MARK: - other
    @discardableResult
    public func multiplier(_ multiplier: CGFloat) -> [VisConstraint] {
        for constraint in self {
            constraint.multiplier(multiplier)
        }
        return self
    }
    
    @discardableResult
    public func priority(_ priority: UILayoutPriority) -> [VisConstraint] {
        for constraint in self {
            constraint.priority = priority
        }
        return self
    }
    
    @discardableResult
    public func isActive(_ isActive: Bool) -> [VisConstraint] {
        for constraint in self {
            constraint.isActive = isActive
        }
        return self
    }
    
    @discardableResult
    public func insets(_ insets: UIEdgeInsets) -> [VisConstraint] {
        for (index, offset) in
            [insets.top, insets.left, -insets.bottom, -insets.right].enumerated() {
            guard self.count > index else {
                break
            }
            self[index].offset(offset)
        }
        return self
    }
    
    
    // MARK: - offset: [CGFloat], CGFloat, CGPoint, CGSize
    @discardableResult
    public func offset(_ offsets: [CGFloat]) -> [VisConstraint] {
        for (index, constraint) in self.enumerated() {
            var offset: CGFloat = 0
            
            if offsets.count > index {
                offset = offsets[index]
            }
            
            constraint.offset(offset)
        }
        return self
    }
    
    @discardableResult
    public func offset(_ offset: CGFloat) -> [VisConstraint] {
        for constraint in self {
            constraint.offset(offset)
        }
        return self
    }

    @discardableResult
    public func offset(_ offset: CGPoint) -> [VisConstraint] {
        for (index, offset) in [offset.x, offset.y].enumerated() {
            guard self.count > index else {
                break
            }
            self[index].offset(offset)
        }
        return self
    }
    
    @discardableResult
    public func offset(_ offset: CGSize) -> [VisConstraint] {
        for (index, offset) in [offset.width, offset.height].enumerated() {
            guard self.count > index else {
                break
            }
            self[index].offset(offset)
        }
        return self
    }
}
