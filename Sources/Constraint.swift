//
//  Constraint.swift
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

public class Constraint {
    
    internal var toItem:      AnyObject?
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

    // MARK: - other
    @discardableResult
    internal func offset <N: VisNumeric>(_ offset: N) -> Constraint {
        constant = offset.vis_floatValue
        return self
    }
    
    @discardableResult
    internal func multiplier <N: VisNumeric>(_ multiplier: N) -> Constraint {
        self.multiplier = multiplier.vis_floatValue
        return self
    }
    
    @discardableResult
    internal func priority(_ priority: UILayoutPriority) -> Constraint {
        self.priority = priority
        return self
    }
    
    @discardableResult
    internal func isActive(_ isActive: Bool) -> Constraint {
        self.isActive = isActive
        return self
    }
    
    internal func set <N: VisNumeric> (number: N, relation: NSLayoutRelation) {
        toItem = nil
        constant = number.vis_floatValue
        self.relation = relation
    }
    
    internal func set <O: VisObject> (object: O, relation: NSLayoutRelation) {
        switch object {
        case is UIView:
            set(view: object as! UIView, relation: relation)
        case is Constraint:
            set(constraint: object as! Constraint, relation: relation)
        default: break
        }
    }
    
    internal func set(view: UIView, relation: NSLayoutRelation) {
        toItem        = view
        toAttribute   = attribute
        self.relation = relation
    }
   
    internal func set(constraint: Constraint, relation: NSLayoutRelation) {
        toItem        = constraint.toItem
        toAttribute   = constraint.attribute
        self.relation = relation
    }
}
