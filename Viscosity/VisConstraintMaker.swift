//
//  VisConstraintMaker.swift
//  Viscosity
//
//  Created by WzxJiang on 16/7/21.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

import UIKit

class VisConstraintMaker: NSObject {
    
    enum VisConstraintMakerType {
        case normal
        case replace
        case update
    }
    
    var constraints: [VisConstraint] = []
    var view: UIView!
    var superView: UIView!
    var type: VisConstraintMakerType = .normal
    
    init(view: UIView) {
        super.init()
        
        guard view.superview != nil else {
            return
        }
        
        if view.translatesAutoresizingMaskIntoConstraints {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.view = view
        self.superView = view.superview
    }
    
    func install() -> Void {
        if type == .replace {
            self.removeAllConstraints()
        }
        
        if type == .update {
            for constraint in constraints {
                self.removeConstraint(constraint)
                self.addConstraint(constraint: constraint)
            }
        } else {
            for constraint in constraints {
                self.addConstraint(constraint: constraint)
            }
        }
    }
    
    
    //MARK: - Add
    private func addConstraint(constraint: VisConstraint) -> Void {
        let toItem  = constraint.toItem
        
        if toItem is UIView {
            self.addConstraintWithView(toItem as! UIView,
                                       constraint: constraint)
        } else if toItem is VisConstraint {
            self.addConstraintWithConstraint(toItem as! VisConstraint,
                                             constraint: constraint)
            
        } else if toItem is NSNumber {
            self.addConstraintWithNumber(toItem as! NSNumber,
                                         constraint: constraint)
        }
    }
    
    private func addConstraintWithView(_ toItem: UIView, constraint: VisConstraint) -> Void {
        let layoutConstraint: NSLayoutConstraint
            = NSLayoutConstraint(item:       view,
                                 attribute:  constraint.attribute,
                                 relatedBy:  constraint.relation,
                                 toItem:     toItem,
                                 attribute:  constraint.attribute,
                                 multiplier: constraint.multiplier,
                                 constant:   constraint.offset)
        
        layoutConstraint.identifier =
            String(format: "%@_%d",
                   Unmanaged.passUnretained(view).toOpaque().debugDescription,
                   constraint.attribute.rawValue)
        
        self.superView?.addConstraint(layoutConstraint)
    }
    
    private func addConstraintWithConstraint(_ toConstraint: VisConstraint, constraint: VisConstraint) -> Void {
        let layoutConstraint: NSLayoutConstraint
            = NSLayoutConstraint(item:       view,
                                 attribute:  constraint.attribute,
                                 relatedBy:  constraint.relation,
                                 toItem:     toConstraint.toItem,
                                 attribute:  toConstraint.attribute,
                                 multiplier: constraint.multiplier,
                                 constant:   constraint.offset)
        
        layoutConstraint.identifier =
            String(format: "%@_%d",
                   Unmanaged.passUnretained(view).toOpaque().debugDescription,
                   constraint.attribute.rawValue)
        
        self.superView?.addConstraint(layoutConstraint)
    }
    
    private func addConstraintWithNumber(_ toItem: NSNumber, constraint: VisConstraint) -> Void {
        let layoutConstraint: NSLayoutConstraint
            = NSLayoutConstraint(item:       view,
                                 attribute:  constraint.attribute,
                                 relatedBy:  constraint.relation,
                                 toItem:     nil,
                                 attribute:  .notAnAttribute,
                                 multiplier: constraint.multiplier,
                                 constant:   CGFloat(toItem.floatValue))
        
        layoutConstraint.identifier =
            String(format: "%@_%d",
                   Unmanaged.passUnretained(view).toOpaque().debugDescription,
                   constraint.attribute.rawValue)
        
        self.superView?.addConstraint(layoutConstraint)
    }
    
    //MARK: - Remove
    private func removeAllConstraints() -> Void {
        let identifier =
            String.init(format: "%@",
                        Unmanaged.passUnretained(view).toOpaque().debugDescription)
        
        var constraints: [NSLayoutConstraint] = []
        
        for constraint in self.superView.constraints {
            if constraint.identifier?.contains(identifier) == true  {
                constraints.append(constraint)
            }
        }
        
        self.superView.removeConstraints(constraints)
    }
    
    private func removeConstraint(_ vis_constraint: VisConstraint) -> Void {
        let identifier =
            String.init(format: "%@_%d",
                        Unmanaged.passUnretained(view).toOpaque().debugDescription,
                        vis_constraint.attribute.rawValue)
        for constraint in self.superView.constraints {
            if constraint.identifier == identifier  {
                self.superView.removeConstraint(constraint)
                return
            }
        }
    }
    
    //MARK: - lazy load
    lazy var left: VisConstraint = {
        var left = VisConstraint()
        left.attribute = .left
        self.constraints.append(left)
        return left
    }()
    
    lazy var right: VisConstraint = {
        var right = VisConstraint()
        right.attribute = .right
        self.constraints.append(right)
        return right
    }()
    
    lazy var top: VisConstraint = {
        var top = VisConstraint()
        top.attribute = .top
        self.constraints.append(top)
        return top
    }()
    
    lazy var bottom: VisConstraint = {
        var bottom = VisConstraint()
        bottom.attribute = .bottom
        self.constraints.append(bottom)
        return bottom
    }()
    
    lazy var width: VisConstraint = {
        var width = VisConstraint()
        width.attribute = .width
        self.constraints.append(width)
        return width
    }()
    
    lazy var height: VisConstraint = {
        var height = VisConstraint()
        height.attribute = .height
        self.constraints.append(height)
        return height
    }()
    
    lazy var centerX: VisConstraint = {
        var centerX = VisConstraint()
        centerX.attribute = .centerX
        self.constraints.append(centerX)
        return centerX
    }()
    
    lazy var centerY: VisConstraint = {
        var centerY = VisConstraint()
        centerY.attribute = .centerY
        self.constraints.append(centerY)
        return centerY
    }()

// TODO: - []
//    lazy var center: [VisConstraint] = {
//        return [self.centerX, self.centerY]
//    }()
}
