//
//  VisConstraintMaker.swift
//  Viscosity
//
//  Created by WzxJiang on 16/7/21.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

import UIKit

class VisConstraintMaker: NSObject {
    //MARK: - enum VisDirection
    enum VisDirection: Int {
        case left
        case right
        case top
        case bottom
        case width
        case height
        case centerX
        case centerY
    }
    
    //MARK: - lazy load
    lazy var left: VisConstraint = {
        self.directions.append(.left)
        return VisConstraint()
    }()
    
    lazy var right: VisConstraint = {
        self.directions.append(.right)
        return VisConstraint()
    }()
    
    lazy var top: VisConstraint = {
        self.directions.append(.top)
        return VisConstraint()
    }()

    lazy var bottom: VisConstraint = {
        self.directions.append(.bottom)
        return VisConstraint()
    }()
    
    lazy var width: VisConstraint = {
        self.directions.append(.width)
        return VisConstraint()
    }()
    
    lazy var height: VisConstraint = {
        self.directions.append(.height)
        return VisConstraint()
    }()
    
    lazy var centerX: VisConstraint = {
        self.directions.append(.centerX)
        return VisConstraint()
    }()
    
    lazy var centerY: VisConstraint = {
        self.directions.append(.centerY)
        return VisConstraint()
    }()

    
    var directions: [VisDirection] = []
    var item:UIView!
    var superView:UIView?
    
    init(item: UIView) {
        super.init()
        self.item = item
        
        if ((self.item.superview) != nil) {
            self.superView = self.item.superview
        } else {
            return
        }
        
        if self.item.translatesAutoresizingMaskIntoConstraints {
            self.item.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    /// install
    func install() -> Void {
        for direction in self.directions {
            self.addConstraint(direction: direction)
        }
    }
    
    private func addConstraint(direction: VisDirection) -> Void {
        switch direction {
        case .left:
            self.addConstraint(constraint: self.left, direction: .left)
        case .right:
            self.addConstraint(constraint: self.right, direction: .right)
        case .top:
            self.addConstraint(constraint: self.top, direction: .top)
        case .bottom:
            self.addConstraint(constraint: self.bottom, direction: .bottom)
        case .width:
            self.addConstraint(constraint: self.width, direction: .width)
        case .height:
            self.addConstraint(constraint: self.height, direction: .height)
        case .centerX:
            self.addConstraint(constraint: self.centerX, direction: .centerX)
        case .centerY:
            self.addConstraint(constraint: self.centerY, direction: .centerY)
        }
    }
    
    private func addConstraint(constraint: VisConstraint, direction: NSLayoutAttribute) -> Void {
        let toItem: AnyObject  = constraint.toItem
        if toItem is VisConstraint{
            self.addConstraintItemConstraint(toItemConstraint: toItem as! VisConstraint, constraint: constraint, direction: direction)
        } else if toItem is CGFloat {
            self.addConstraintFloat(toItem: toItem as! CGFloat, constraint: constraint, direction: direction)
        } else if toItem is Int {
            self.addConstraintFloat(toItem: toItem as! CGFloat, constraint: constraint, direction: direction)
        } else {
            self.addConstraintView(toItem: toItem, constraint: constraint, direction: direction)
        }
    }
    
    private func addConstraintView(toItem: Any, constraint: VisConstraint, direction: NSLayoutAttribute) -> Void {
        self.superView?.addConstraint(
            NSLayoutConstraint.init(item:       self.item,
                                    attribute:  direction,
                                    relatedBy:  constraint.relation,
                                    toItem:     toItem as! UIView,
                                    attribute:  direction,
                                    multiplier: constraint.multiplier,
                                    constant:   constraint.offset)
        )
    }
    
    private func addConstraintFloat(toItem: CGFloat, constraint: VisConstraint, direction: NSLayoutAttribute) -> Void {
        self.superView?.addConstraint(
            NSLayoutConstraint.init(item:       self.item,
                                    attribute:  direction,
                                    relatedBy:  constraint.relation,
                                    toItem:     nil,
                                    attribute:  direction,
                                    multiplier: constraint.multiplier,
                                    constant:   toItem)
        )

    }
    
    private func addConstraintItemConstraint(toItemConstraint: VisConstraint, constraint: VisConstraint, direction: NSLayoutAttribute) -> Void {
        self.superView?.addConstraint(
            NSLayoutConstraint.init(item:       self.item,
                                    attribute:  direction,
                                    relatedBy:  constraint.relation,
                                    toItem:     toItemConstraint.fromItem,
                                    attribute:  toItemConstraint.direction!,
                                    multiplier: constraint.multiplier,
                                    constant:   constraint.offset)
        )
    }
}
