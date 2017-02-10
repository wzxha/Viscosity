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
        let constraints = self.superView.constraints
        
        for constraint in constraints {
            guard constraint.firstItem is UIView else {
                continue
            }
            
            if constraint.firstItem as! UIView == view {
                self.superView.removeConstraint(constraint)
            }
        }
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
        return self.visConstraint(attribute: .left)
    }
    
    public var right: VisConstraint {
        return self.visConstraint(attribute: .right)
    }
    
    public var top: VisConstraint {
        return self.visConstraint(attribute: .top)
    }
    
    public var bottom: VisConstraint {
        return self.visConstraint(attribute: .bottom)
    }
    
    public var leading: VisConstraint {
        return self.visConstraint(attribute: .leading)
    }
    
    public var trailing: VisConstraint {
        return self.visConstraint(attribute: .trailing)
    }
    
    public var width: VisConstraint {
        return self.visConstraint(attribute: .width)
    }
    
    public var height: VisConstraint {
        return self.visConstraint(attribute: .height)
    }
    
    public var centerX: VisConstraint {
        return self.visConstraint(attribute: .centerX)
    }
    
    public var centerY: VisConstraint {
        return self.visConstraint(attribute: .centerY)
    }
    
    public var lastBaseline: VisConstraint {
        return self.visConstraint(attribute: .lastBaseline)
    }
    
    @available(iOS 8.0, *)
    public var firstBaseline: VisConstraint {
        return self.visConstraint(attribute: .firstBaseline)
    }
    
    @available(iOS 8.0, *)
    public var leftMargin: VisConstraint {
        return self.visConstraint(attribute: .leftMargin)
    }
    
    @available(iOS 8.0, *)
    public var rightMargin: VisConstraint {
        return self.visConstraint(attribute: .rightMargin)
    }
    
    @available(iOS 8.0, *)
    public var topMargin: VisConstraint {
        return self.visConstraint(attribute: .topMargin)
    }
    
    @available(iOS 8.0, *)
    public var bottomMargin: VisConstraint {
        return self.visConstraint(attribute: .bottomMargin)
    }
    
    @available(iOS 8.0, *)
    public var leadingMargin: VisConstraint {
        return self.visConstraint(attribute: .leadingMargin)
    }
    
    @available(iOS 8.0, *)
    public var trailingMargin: VisConstraint {
        return self.visConstraint(attribute: .trailingMargin)
    }
    
    @available(iOS 8.0, *)
    public var centerXWithinMargins: VisConstraint {
        return self.visConstraint(attribute: .centerXWithinMargins)
    }
    
    @available(iOS 8.0, *)
    public var centerYWithinMargins: VisConstraint {
        return self.visConstraint(attribute: .centerYWithinMargins)
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
    
    private func visConstraint(attribute: NSLayoutAttribute) -> VisConstraint {
        let constraint = VisConstraint(attribute: attribute)
        self.constraints.append(constraint)
        return constraint
    }
}

public extension VisConstraintMaker {
    public subscript (types: NSLayoutAttribute...) -> [VisConstraint] {
        var visConstraints: [VisConstraint] = []
        for type in types {
            switch type {
            case .left:
                visConstraints.append(self.left)
            case .right:
                visConstraints.append(self.right)
            case .top:
                visConstraints.append(self.top)
            case .bottom:
                visConstraints.append(self.bottom)
            case .leading:
                visConstraints.append(self.leading)
            case .trailing:
                visConstraints.append(self.trailing)
            case .width:
                visConstraints.append(self.width)
            case .height:
                visConstraints.append(self.height)
            case .centerX:
                visConstraints.append(self.centerX)
            case .centerY:
                visConstraints.append(self.centerY)
            case .lastBaseline:
                visConstraints.append(self.lastBaseline)
            case .firstBaseline:
                visConstraints.append(self.firstBaseline)
            case .leftMargin:
                visConstraints.append(self.leftMargin)
            case .rightMargin:
                visConstraints.append(self.rightMargin)
            case .topMargin:
                visConstraints.append(self.topMargin)
            case .bottomMargin:
                visConstraints.append(self.bottomMargin)
            case .leadingMargin:
                visConstraints.append(self.leadingMargin)
            case .trailingMargin:
                visConstraints.append(self.trailingMargin)
            case .centerXWithinMargins:
                visConstraints.append(self.centerXWithinMargins)
            case .centerYWithinMargins:
                visConstraints.append(self.centerYWithinMargins)
            default: break
            }
        }
        return visConstraints
    }
}

