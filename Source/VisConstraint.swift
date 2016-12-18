//
//  VisConstraint.swift
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

public class VisConstraint: NSObject {
    
    //MARK: - var
    public var toItem:      AnyObject?
    internal var constant:    CGFloat = 0
    internal var multiplier:  CGFloat = 1
    internal var isActive:    Bool    = true
    internal var priority:    UILayoutPriority  = UILayoutPriorityRequired
    internal var relation:    NSLayoutRelation  = .equal
    internal var attribute:   NSLayoutAttribute = .notAnAttribute
    internal var toAttribute: NSLayoutAttribute = .notAnAttribute
    
    init(attribute: NSLayoutAttribute) {
        self.attribute = attribute
    }
    
    @discardableResult
    public func equalTo(_ toItem: AnyObject) -> VisConstraint {
        self.set(toItem: toItem)
        relation = .equal
        return self
    }
    
    @discardableResult
    public func greaterThanOrEqualTo(_ toItem: AnyObject) -> VisConstraint {
        self.set(toItem: toItem)
        relation = .greaterThanOrEqual
        return self
    }
    
    @discardableResult
    public func lessThanOrEqualTo(_ toItem: AnyObject) -> VisConstraint {
        self.set(toItem: toItem)
        relation = .lessThanOrEqual
        return self
    }

    @discardableResult
    public func offset(_ offset: CGFloat) -> VisConstraint {
        self.constant = offset
        return self
    }
    
    @discardableResult
    public func multiplier(_ multiplier: CGFloat) -> VisConstraint {
        self.multiplier = multiplier
        return self
    }
    
    @discardableResult
    public func priority(_ priority: UILayoutPriority) -> VisConstraint {
        self.priority = priority
        return self
    }
    
    @discardableResult
    public func isActive(_ isActive: Bool) -> VisConstraint {
        self.isActive = isActive
        return self
    }
    
    private func set(toItem: AnyObject) -> Void {
        if toItem is UIView {
            self.toItem = toItem as! UIView
            toAttribute = attribute
        } else if toItem is VisConstraint {
            let vis_constraint = toItem as! VisConstraint
            self.toItem = vis_constraint.toItem
            toAttribute = vis_constraint.attribute
        } else {
            self.setNumber(toItem: toItem)
        }
    }
    
    private func setNumber(toItem: AnyObject) -> Void {
        if toItem is Int {
            self.constant = CGFloat(toItem as! Int)
        } else if toItem is Float {
            self.constant = CGFloat(toItem as! Float)
        } else if toItem is NSNumber {
            self.constant = CGFloat(toItem as! NSNumber)
        } else {
            self.constant = toItem as! CGFloat
        }
        
        self.toItem = nil
    }
}
