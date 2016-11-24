//
//  VisConstraint.swift
//  Viscosity
//
//  Created by WzxJiang on 16/7/21.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

import UIKit

class VisConstraint: NSObject {
    
    //MARK: - var
    var toItem:     AnyObject!
    var relation:   NSLayoutRelation!
    var offset:     CGFloat     = 0
    var multiplier: CGFloat     = 1
    var direction:  NSLayoutAttribute?
    var fromItem:   UIView?
    
    //MARK: - relation
    func equalTo<T>(_ toItem: T) -> Void {
        self.equalTo(toItem, offset: 0)
    }
    
    func greaterThanOrEqualTo<T>(_ toItem: T) -> Void {
        self.greaterThanOrEqualTo(toItem, offset: 0)
    }
    
    func lessThanOrEqualTo<T>(_ toItem: T) -> Void {
        self.lessThanOrEqualTo(toItem, offset: 0)
    }

    //MARK: - relation offset
    func equalTo<T>(_ toItem: T, offset: CGFloat) -> Void {
        self.set(toItem: toItem,
                 relation: .equal,
                 multiplier: 1,
                 offset: offset)
    }
    
    func greaterThanOrEqualTo<T>(_ toItem: T, offset: CGFloat) -> Void {
        self.set(toItem: toItem,
                 relation: .greaterThanOrEqual,
                 multiplier: 1,
                 offset: offset)
    }
    
    func lessThanOrEqualTo<T>(_ toItem: T, offset: CGFloat) -> Void {
        self.set(toItem: toItem,
                 relation: .lessThanOrEqual,
                 multiplier: 1,
                 offset: offset)
    }
    
    //MARK: - relation multiplier
    func equalTo(_ toItem: AnyObject, multiplier: CGFloat) -> Void {
        self.set(toItem: toItem,
                 relation: .equal,
                 multiplier: multiplier,
                 offset: 0)
    }
    
    func greaterThanOrEqualTo(_ toItem: AnyObject, multiplier: CGFloat) -> Void {
        self.set(toItem: toItem,
                 relation: .greaterThanOrEqual,
                 multiplier: multiplier,
                 offset: 0)
    }
    
    func lessThanOrEqualTo(_ toItem: AnyObject, multiplier: CGFloat) -> Void {
        self.set(toItem: toItem,
                 relation: .lessThanOrEqual,
                 multiplier: multiplier,
                 offset: 0)
    }

    
    //MARK: - relation offset multiplier
    func equalTo(_ toItem: AnyObject, multiplier: CGFloat, offset: CGFloat) -> Void {
        self.set(toItem: toItem,
                 relation: .equal,
                 multiplier: multiplier,
                 offset: offset)
    }
    
    func greaterThanOrEqualTo(_ toItem: AnyObject, multiplier: CGFloat, offset: CGFloat) -> Void {
        self.set(toItem: toItem,
                 relation: .greaterThanOrEqual,
                 multiplier: multiplier,
                 offset: offset)
    }
    
    func lessThanOrEqualTo(_ toItem: AnyObject, multiplier: CGFloat, offset: CGFloat) -> Void {
        self.set(toItem: toItem,
                 relation: .lessThanOrEqual,
                 multiplier: multiplier,
                 offset: offset)
    }
    
    private func set<T>(toItem: T, relation: NSLayoutRelation, multiplier: CGFloat, offset: CGFloat) -> Void {
        self.toItem     = toItem as AnyObject!
        self.relation   = relation
        self.multiplier = multiplier
        self.offset     = offset
    }
}
