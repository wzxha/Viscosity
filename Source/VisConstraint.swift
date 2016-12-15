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
    var toItem:     Any!
    var offset:     CGFloat     = 0
    var multiplier: CGFloat     = 1
    var relation:   NSLayoutRelation  = .equal
    var attribute:  NSLayoutAttribute = .notAnAttribute
    
    //MARK: - relation
    public func equalTo <T> (_ toItem: T) -> Void {
        self.equalTo(toItem, offset: 0)
    }
    
    public func greaterThanOrEqualTo <T> (_ toItem: T) -> Void {
        self.greaterThanOrEqualTo(toItem, offset: 0)
    }
    
    public func lessThanOrEqualTo <T> (_ toItem: T) -> Void {
        self.lessThanOrEqualTo(toItem, offset: 0)
    }

    //MARK: - relation offset
    public func equalTo <T> (_ toItem: T, offset: CGFloat) -> Void {
        self.equalTo(toItem,
                     multiplier: 1,
                     offset: offset)
    }
    
    public func greaterThanOrEqualTo <T> (_ toItem: T, offset: CGFloat) -> Void {
        self.greaterThanOrEqualTo(toItem,
                                  multiplier: 1,
                                  offset: offset)
    }
    
    public func lessThanOrEqualTo <T> (_ toItem: T, offset: CGFloat) -> Void {
        self.lessThanOrEqualTo(toItem,
                               multiplier: 1,
                               offset: offset)
    }
    
    //MARK: - relation multiplier
    public func equalTo <T> (_ toItem: T, multiplier: CGFloat) -> Void {
        self.equalTo(toItem,
                     multiplier: multiplier,
                     offset: 0)
    }
    
    public func greaterThanOrEqualTo <T> (_ toItem: T, multiplier: CGFloat) -> Void {
        self.greaterThanOrEqualTo(toItem,
                                  multiplier: multiplier,
                                  offset: 0)
    }
    
    public func lessThanOrEqualTo <T> (_ toItem: T, multiplier: CGFloat) -> Void {
        self.lessThanOrEqualTo(toItem,
                               multiplier: multiplier,
                               offset: 0)
    }

    
    //MARK: - relation offset multiplier
    public func equalTo <T> (_ toItem: T, multiplier: CGFloat, offset: CGFloat) -> Void {
        self.set(toItem: toItem,
                 relation: .equal,
                 multiplier: multiplier,
                 offset: offset)
    }
    
    public func greaterThanOrEqualTo <T> (_ toItem: T, multiplier: CGFloat, offset: CGFloat) -> Void {
        self.set(toItem: toItem,
                 relation: .greaterThanOrEqual,
                 multiplier: multiplier,
                 offset: offset)
    }
    
    public func lessThanOrEqualTo <T> (_ toItem: T, multiplier: CGFloat, offset: CGFloat) -> Void {
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

public extension Array where Element: VisConstraint {
    
    //MARK: - relation
    public func equalTo <T> (_ toItem: T) -> Void {
        self.equalTo(toItem, offset: nil)
    }
    
    public func greaterThanOrEqualTo <T> (_ toItem: T) -> Void {
        self.greaterThanOrEqualTo(toItem, offsets: nil)
    }
    
    public func lessThanOrEqualTo <T> (_ toItem: T) -> Void {
        self.lessThanOrEqualTo(toItem, offsets: nil)
    }
    
    //MARK: - relation offset
    public func equalTo <T> (_ toItem: T, offset: [CGFloat]?) -> Void {
        self.equalTo(toItem,
                     multiplier: 1,
                     offsets: offset)
    }
    
    public func greaterThanOrEqualTo <T> (_ toItem: T, offsets: [CGFloat]?) -> Void {
        self.greaterThanOrEqualTo(toItem,
                                  multiplier: 1,
                                  offsets: offsets)
    }
    
    public func lessThanOrEqualTo <T> (_ toItem: T, offsets: [CGFloat]?) -> Void {
        self.lessThanOrEqualTo(toItem,
                               multiplier: 1,
                               offsets: offsets)
    }
    
    //MARK: - relation multiplier
    public func equalTo <T> (_ toItem: T, multiplier: CGFloat) -> Void {
        self.equalTo(toItem,
                     multiplier: multiplier,
                     offsets: nil)
    }
    
    public func greaterThanOrEqualTo <T> (_ toItem: T, multiplier: CGFloat) -> Void {
        self.greaterThanOrEqualTo(toItem,
                                  multiplier: multiplier,
                                  offsets: nil)
    }
    
    public func lessThanOrEqualTo <T> (_ toItem: T, multiplier: CGFloat) -> Void {
        self.lessThanOrEqualTo(toItem,
                               multiplier: multiplier,
                               offsets: nil)
    }
    
    
    //MARK: - relation offset multiplier
    public func equalTo <T> (_ toItem: T, multiplier: CGFloat, offsets: [CGFloat]?) -> Void {
        for (index, constraint) in self.enumerated() {
            var offset: CGFloat = 0
            
            if offsets != nil {
                let offsets = offsets!
                if  offsets.count > index {
                    offset = offsets[index]
                }
            }
            
            constraint.equalTo(toItem, multiplier: multiplier, offset: offset)
        }
    }
    
    public func greaterThanOrEqualTo <T> (_ toItem: T, multiplier: CGFloat, offsets: [CGFloat]?) -> Void {
        for (index, constraint) in self.enumerated() {
            var offset: CGFloat = 0
            
            if offsets != nil {
                let offsets = offsets!
                if  offsets.count > index {
                    offset = offsets[index]
                }
            }
            
            constraint.greaterThanOrEqualTo(toItem, multiplier: multiplier, offset: offset)
        }
    }
    
    public func lessThanOrEqualTo <T> (_ toItem: T, multiplier: CGFloat, offsets: [CGFloat]?) -> Void {
        for (index, constraint) in self.enumerated() {
            var offset: CGFloat = 0
            
            if offsets != nil {
                let offsets = offsets!
                if  offsets.count > index {
                    offset = offsets[index]
                }
            }
            
            constraint.lessThanOrEqualTo(toItem, multiplier: multiplier, offset: offset)
        }
    }

}
