//
//  Debug.swift
//  Viscosity
//
//  Created by WzxJiang on 17/7/6.
//  Copyright © 2017年 WzxJiang. All rights reserved.
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
@testable import Viscosity

protocol Descriptionable {
    var description: String { get }
}

extension UIView {
    func constraint(forAttribute attribute: NSLayoutAttribute) -> [Constraint] {
        guard let superView = superview else { return [] }
        
        return superView.constraints
                .map { $0.constraint }
                .filter {
                    guard let view = $0.fromItem as? UIView, view == self else {  return false }
                
                    return $0.attribute == attribute
                }
    }
    
    @discardableResult
    func then(_ closure: (UIView) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension NSLayoutAttribute: Descriptionable {
    var description: String {
        switch self {
        case .top:                  return "top"
        case .left:                 return "left"
        case .right:                return "right"
        case .bottom:               return "bottom"
        case .leading:              return "leading"
        case .trailing:             return "trailing"
        case .lastBaseline:         return "lastBaseline"
        case .firstBaseline:        return "firstBaseline"
        case .topMargin:            return "topMargin"
        case .leftMargin:           return "leftMargin"
        case .rightMargin:          return "rightMargin"
        case .bottomMargin:         return "bottomMargin"
        case .leadingMargin:        return "leadingMargin"
        case .trailingMargin:       return "trailingMargin"
        case .width:                return "width"
        case .height:               return "height"
        case .centerX:              return "centerX"
        case .centerY:              return "centerY"
        case .centerXWithinMargins: return "centerXWithinMargins"
        case .centerYWithinMargins: return "centerYWithinMargins"
        case .notAnAttribute:       return ""
        }
    }
}

extension NSLayoutRelation: Descriptionable {
    var description: String {
        switch self {
        case .equal:              return "=="
        case .greaterThanOrEqual: return ">="
        case .lessThanOrEqual:    return "<="
        }
    }
}

extension Constraint: Descriptionable {
    var description: String {
        return
            [attribute.description,
             relation.description,
             toItem?.description ?? "",
             toAttribute.description,
             "+~",
             constant.description,
             "*~",
             multiplier.description,
             "~~",
             priority.description,
             "~|",
             isActive.description]
            .joined(separator: " ")
    }
}














