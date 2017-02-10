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
        
        self.type = type
        self.view = view
        superView = view.superview!
    }
    
    internal func install() -> Void {
        switch type {
        case .update:
            for constraint in constraints {
                let similars = layoutConstraintSimilarTo(constraint)
                
                guard let _ = similars.perfect else {
                    if let rough = similars.rough {
                        superView.removeConstraint(rough)
                    }
                    addConstraint(constraint)
                    continue
                }
                
                similars.perfect!.constant = constraint.constant
            }
        case .replace:
            removeAllConstraints()
            fallthrough
        case .normal:
            for constraint in constraints {
                addConstraint(constraint)
            }
        }
    }
    
    // MARK: - Add
    private func addConstraint(_ constraint: VisConstraint) -> Void {
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
        
        superView.addConstraint(layoutConstraint)
    }
    
    // MARK: - Remove
    private func removeAllConstraints() -> Void {
        let constraints = superView.constraints
        
        for constraint in constraints {
            guard constraint.firstItem is UIView else {
                continue
            }
            
            if constraint.firstItem as! UIView == view {
                superView.removeConstraint(constraint)
            }
        }
    }
    
    private func layoutConstraintSimilarTo(_ vis_constraint: VisConstraint) -> (rough: NSLayoutConstraint?, perfect: NSLayoutConstraint?) {
        var roughSimilarConstraint: NSLayoutConstraint?
        var perfectSimilarConstraint: NSLayoutConstraint?
        
        for constraint in superView.constraints {
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
        return constraint(attribute: .left)
    }
    
    public var right: VisConstraint {
        return constraint(attribute: .right)
    }
    
    public var top: VisConstraint {
        return constraint(attribute: .top)
    }
    
    public var bottom: VisConstraint {
        return constraint(attribute: .bottom)
    }
    
    public var leading: VisConstraint {
        return constraint(attribute: .leading)
    }
    
    public var trailing: VisConstraint {
        return constraint(attribute: .trailing)
    }
    
    public var width: VisConstraint {
        return constraint(attribute: .width)
    }
    
    public var height: VisConstraint {
        return constraint(attribute: .height)
    }
    
    public var centerX: VisConstraint {
        return constraint(attribute: .centerX)
    }
    
    public var centerY: VisConstraint {
        return constraint(attribute: .centerY)
    }
    
    public var lastBaseline: VisConstraint {
        return constraint(attribute: .lastBaseline)
    }
    
    @available(iOS 8.0, *)
    public var firstBaseline: VisConstraint {
        return constraint(attribute: .firstBaseline)
    }
    
    @available(iOS 8.0, *)
    public var leftMargin: VisConstraint {
        return constraint(attribute: .leftMargin)
    }
    
    @available(iOS 8.0, *)
    public var rightMargin: VisConstraint {
        return constraint(attribute: .rightMargin)
    }
    
    @available(iOS 8.0, *)
    public var topMargin: VisConstraint {
        return constraint(attribute: .topMargin)
    }
    
    @available(iOS 8.0, *)
    public var bottomMargin: VisConstraint {
        return constraint(attribute: .bottomMargin)
    }
    
    @available(iOS 8.0, *)
    public var leadingMargin: VisConstraint {
        return constraint(attribute: .leadingMargin)
    }
    
    @available(iOS 8.0, *)
    public var trailingMargin: VisConstraint {
        return constraint(attribute: .trailingMargin)
    }
    
    @available(iOS 8.0, *)
    public var centerXWithinMargins: VisConstraint {
        return constraint(attribute: .centerXWithinMargins)
    }
    
    @available(iOS 8.0, *)
    public var centerYWithinMargins: VisConstraint {
        return constraint(attribute: .centerYWithinMargins)
    }
    
    public var center: [VisConstraint] {
        return [centerX, centerY]
    }
    
    public var edges: [VisConstraint] {
        return [top, left, bottom, right]
    }
    
    public var size: [VisConstraint] {
        return [width, height]
    }
    
    private func constraint(attribute: NSLayoutAttribute) -> VisConstraint {
        let constraint = VisConstraint(attribute: attribute)
        constraints.append(constraint)
        return constraint
    }
}

public extension VisConstraintMaker {
    public subscript (types: NSLayoutAttribute...) -> [VisConstraint] {
        var visConstraints: [VisConstraint] = []
        for type in types {
            switch type {
            case .left:
                visConstraints.append(left)
            case .right:
                visConstraints.append(right)
            case .top:
                visConstraints.append(top)
            case .bottom:
                visConstraints.append(bottom)
            case .leading:
                visConstraints.append(leading)
            case .trailing:
                visConstraints.append(trailing)
            case .width:
                visConstraints.append(width)
            case .height:
                visConstraints.append(height)
            case .centerX:
                visConstraints.append(centerX)
            case .centerY:
                visConstraints.append(centerY)
            case .lastBaseline:
                visConstraints.append(lastBaseline)
            case .firstBaseline:
                visConstraints.append(firstBaseline)
            case .leftMargin:
                visConstraints.append(leftMargin)
            case .rightMargin:
                visConstraints.append(rightMargin)
            case .topMargin:
                visConstraints.append(topMargin)
            case .bottomMargin:
                visConstraints.append(bottomMargin)
            case .leadingMargin:
                visConstraints.append(leadingMargin)
            case .trailingMargin:
                visConstraints.append(trailingMargin)
            case .centerXWithinMargins:
                visConstraints.append(centerXWithinMargins)
            case .centerYWithinMargins:
                visConstraints.append(centerYWithinMargins)
            default: break
            }
        }
        return visConstraints
    }
}

