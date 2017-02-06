//
//  VisConstraintMaker.swift
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

public class VisConstraintMaker: NSObject {
    
    enum VisConstraintMakerType {
        case normal
        case replace
        case update
    }

    private var constraints: [VisConstraint] = []
    private var view: UIView!
    private var superView: UIView!
    private var type: VisConstraintMakerType = .normal
    
    init(view: UIView, type: VisConstraintMakerType) {
        super.init()
        
        assert(view.superview != nil, "[Viscosity]: \(view) superview == nil")
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view = view
    
        self.superView = view.superview!
        
        self.type = type
    }
    
    internal func install() -> Void {
        switch type {
        case .update:
            for vis_constraint in constraints {
                let similars = self.layoutConstraintSimilarTo(vis_constraint)
                
                guard let _ = similars.perfect else {
                    
                    if let rough = similars.rough {
                        self.superView.removeConstraint(rough)
                    }
                    
                    self.addConstraint(constraint: vis_constraint)
                    continue
                }
                
                similars.perfect!.constant = vis_constraint.constant
            }
        case .replace:
            self.removeAllConstraints()
            fallthrough
        case .normal:
            for vis_constraint in constraints {
                self.addConstraint(constraint: vis_constraint)
            }
        }
    }
    
    // MARK: - Add
    private func addConstraint(constraint: VisConstraint) -> Void {
        let layoutConstraint: NSLayoutConstraint
            = NSLayoutConstraint(item:       view,
                                 attribute:  constraint.attribute,
                                 relatedBy:  constraint.relation,
                                 toItem:     constraint.toItem,
                                 attribute:  constraint.toAttribute,
                                 multiplier: constraint.multiplier,
                                 constant:   constraint.constant)
        
        layoutConstraint.priority = constraint.priority
        layoutConstraint.isActive = constraint.isActive
        
        self.superView.addConstraint(layoutConstraint)
    }
    
    // MARK: - Remove
    private func removeAllConstraints() -> Void {
        var constraints: [NSLayoutConstraint] = []
        
        for constraint in self.superView.constraints {
            guard constraint.firstItem is UIView else {
                continue
            }
            
            if constraint.firstItem as! UIView == view {
                constraints.append(constraint)
            }
        }
    
        self.superView.removeConstraints(constraints)
    }
    
    private func layoutConstraintSimilarTo(_ vis_constraint: VisConstraint) -> (rough: NSLayoutConstraint?, perfect: NSLayoutConstraint?) {
        var roughSimilarConstraint: NSLayoutConstraint?
        var perfectSimilarConstraint: NSLayoutConstraint?
        
        for constraint in self.superView.constraints {
            guard constraint.firstItem is UIView else {
                continue
            }
            
            guard constraint.firstItem as! UIView == view,
                  constraint.firstAttribute == vis_constraint.attribute,
                  constraint.relation == vis_constraint.relation else {
                continue
            }
            
            roughSimilarConstraint = constraint
            
            if roughSimilarConstraint == constraint,
               constraint.multiplier  == vis_constraint.multiplier,
               constraint.priority    == vis_constraint.priority {
               perfectSimilarConstraint = constraint
            }
        }
        return (roughSimilarConstraint, perfectSimilarConstraint)
    }

    
    // MARK: - constraints
    public var left: VisConstraint {
        let left = VisConstraint(attribute: .left)
        self.constraints.append(left)
        return left
    }
    
    public var right: VisConstraint {
        let right = VisConstraint(attribute: .right)
        self.constraints.append(right)
        return right
    }
    
    public var top: VisConstraint {
        let top = VisConstraint(attribute: .top)
        self.constraints.append(top)
        return top
    }
    
    public var bottom: VisConstraint {
        let bottom = VisConstraint(attribute: .bottom)
        self.constraints.append(bottom)
        return bottom
    }
    
    public var leading: VisConstraint {
        let leading = VisConstraint(attribute: .leading)
        self.constraints.append(leading)
        return leading
    }
    
    public var trailing: VisConstraint {
        let trailing = VisConstraint(attribute: .trailing)
        self.constraints.append(trailing)
        return trailing
    }
    
    public var width: VisConstraint {
        let width = VisConstraint(attribute: .width)
        self.constraints.append(width)
        return width
    }
    
    public var height: VisConstraint {
        let height = VisConstraint(attribute: .height)
        self.constraints.append(height)
        return height
    }
    
    public var centerX: VisConstraint {
        let centerX = VisConstraint(attribute: .centerX)
        self.constraints.append(centerX)
        return centerX
    }
    
    public var centerY: VisConstraint {
        let centerY = VisConstraint(attribute: .centerY)
        self.constraints.append(centerY)
        return centerY
    }
    
    public var lastBaseline: VisConstraint {
        let lastBaseline = VisConstraint(attribute: .lastBaseline)
        self.constraints.append(lastBaseline)
        return lastBaseline
    }
    
    @available(iOS 8.0, *)
    public var firstBaseline: VisConstraint {
        let firstBaseline = VisConstraint(attribute: .firstBaseline)
        self.constraints.append(firstBaseline)
        return firstBaseline
    }
        
    @available(iOS 8.0, *)
    public var leftMargin: VisConstraint {
        let leftMargin = VisConstraint(attribute: .leftMargin)
        self.constraints.append(leftMargin)
        return leftMargin
    }
        
    @available(iOS 8.0, *)
    public var rightMargin: VisConstraint {
        let rightMargin = VisConstraint(attribute: .rightMargin)
        self.constraints.append(rightMargin)
        return rightMargin
    }
        
    @available(iOS 8.0, *)
    public var topMargin: VisConstraint {
        let topMargin = VisConstraint(attribute: .topMargin)
        self.constraints.append(topMargin)
        return topMargin
    }
    
    @available(iOS 8.0, *)
    public var bottomMargin: VisConstraint {
        let bottomMargin = VisConstraint(attribute: .bottomMargin)
        self.constraints.append(bottomMargin)
        return bottomMargin
    }
        
    @available(iOS 8.0, *)
    public var leadingMargin: VisConstraint {
        let leadingMargin = VisConstraint(attribute: .leadingMargin)
        self.constraints.append(leadingMargin)
        return leadingMargin
    }
        
    @available(iOS 8.0, *)
    public var trailingMargin: VisConstraint {
        let trailingMargin = VisConstraint(attribute: .trailingMargin)
        self.constraints.append(trailingMargin)
        return trailingMargin
    }
    
    @available(iOS 8.0, *)
    public var centerXWithinMargins: VisConstraint {
        let centerXWithinMargins = VisConstraint(attribute: .centerXWithinMargins)
        self.constraints.append(centerXWithinMargins)
        return centerXWithinMargins
    }
        
    @available(iOS 8.0, *)
    public var centerYWithinMargins: VisConstraint {
        let centerYWithinMargins = VisConstraint(attribute: .centerYWithinMargins)
        self.constraints.append(centerYWithinMargins)
        return centerYWithinMargins
    }
    
    public var center: [VisConstraint] {
        return [self.centerX, self.centerY]
    }
    
    public var edges: [VisConstraint] {
        return [self.top, self.left, self.bottom, self.right]
    }
    
    public var size: [VisConstraint] {
        return [self.width, self.height]
    }
}
