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
    var toItem:     Any!
    var offset:     CGFloat     = 0
    var multiplier: CGFloat     = 1
    var relation:   NSLayoutRelation  = .equal
    var attribute:  NSLayoutAttribute = .notAnAttribute
    
    //MARK: - relation
    func equalTo <T> (_ toItem: T) -> Void {
        self.equalTo(toItem, offset: 0)
    }
    
    func greaterThanOrEqualTo <T> (_ toItem: T) -> Void {
        self.greaterThanOrEqualTo(toItem, offset: 0)
    }
    
    func lessThanOrEqualTo <T> (_ toItem: T) -> Void {
        self.lessThanOrEqualTo(toItem, offset: 0)
    }

    //MARK: - relation offset
    func equalTo <T> (_ toItem: T, offset: CGFloat) -> Void {
        self.equalTo(toItem,
                     multiplier: 1,
                     offset: offset)
    }
    
    func greaterThanOrEqualTo <T> (_ toItem: T, offset: CGFloat) -> Void {
        self.greaterThanOrEqualTo(toItem,
                                  multiplier: 1,
                                  offset: offset)
    }
    
    func lessThanOrEqualTo <T> (_ toItem: T, offset: CGFloat) -> Void {
        self.lessThanOrEqualTo(toItem,
                               multiplier: 1,
                               offset: offset)
    }
    
    //MARK: - relation multiplier
    func equalTo <T> (_ toItem: T, multiplier: CGFloat) -> Void {
        self.equalTo(toItem,
                     multiplier: multiplier,
                     offset: 0)
    }
    
    func greaterThanOrEqualTo <T> (_ toItem: T, multiplier: CGFloat) -> Void {
        self.greaterThanOrEqualTo(toItem,
                                  multiplier: multiplier,
                                  offset: 0)
    }
    
    func lessThanOrEqualTo <T> (_ toItem: T, multiplier: CGFloat) -> Void {
        self.lessThanOrEqualTo(toItem,
                               multiplier: multiplier,
                               offset: 0)
    }

    
    //MARK: - relation offset multiplier
    func equalTo <T> (_ toItem: T, multiplier: CGFloat, offset: CGFloat) -> Void {
        self.set(toItem: toItem,
                 relation: .equal,
                 multiplier: multiplier,
                 offset: offset)
    }
    
    func greaterThanOrEqualTo <T> (_ toItem: T, multiplier: CGFloat, offset: CGFloat) -> Void {
        self.set(toItem: toItem,
                 relation: .greaterThanOrEqual,
                 multiplier: multiplier,
                 offset: offset)
    }
    
    func lessThanOrEqualTo <T> (_ toItem: T, multiplier: CGFloat, offset: CGFloat) -> Void {
        self.set(toItem: toItem,
                 relation: .lessThanOrEqual,
                 multiplier: multiplier,
                 offset: offset)
    }
    
    private func set <T> (toItem: T, relation: NSLayoutRelation, multiplier: CGFloat, offset: CGFloat) -> Void {
        
        if toItem is Float,
           toItem is Int,
           toItem is CGFloat {
            self.toItem = toItem as! NSNumber
        } else {
            self.toItem = toItem
        }
        
        self.relation   = relation
        self.multiplier = multiplier
        self.offset     = offset
    }
}

extension Array {
    
    func equalTo(_ toItem: AnyObject, multiplier: CGFloat, offset: CGPoint) -> Void {
        
    }
    
    func greaterThanOrEqualTo(_ toItem: AnyObject, multiplier: CGFloat, offset: CGPoint) -> Void {
        
    }
    
    func lessThanOrEqualTo(_ toItem: AnyObject, multiplier: CGFloat, offset: CGPoint) -> Void {
        
    }

}
