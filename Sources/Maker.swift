//
//  Maker.swift
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

public class Maker {
    internal var manager: Manager
    
    internal enum InstallType {
        case normal
        case replace
        case update
    }
    
    internal var constraints: [Constraint] = []
    
    internal var view: UIView {
        return manager.view
    }
    
    var superView: UIView
    
    init?(manager: Manager) {
        let view = manager.view
        view.translatesAutoresizingMaskIntoConstraints = false
        
        guard let superView = view.superview else { return nil }
        
        self.manager = manager
        self.superView = superView
    }
    
    internal func install(_ type: InstallType = .normal) {
        switch type {
        case .update:
            updateAllConstraints()
        case .replace:
            removeAllConstraints()
            fallthrough
        case .normal:
            addAllConstraints()
        }
    }
    
    // MARK: - Add
    private func addAllConstraints() {
        constraints.forEach {
            add(constraint: $0)
        }
    }
    
    private func add(constraint: Constraint) {
        superView.addConstraint(constraint.layoutConstraint)
    }
    
    // MARK: - Remove
    private func removeAllConstraints() -> Void {
        let constraints = superView.constraints
        
        for constraint in constraints {
            guard let view = constraint.firstItem as? UIView else {
                continue
            }
            
            if view == self.view {
                superView.removeConstraint(constraint)
            }
        }
    }
    
    // MARK: - Update
    private func updateAllConstraints() -> Void {
        for constraint in constraints {
            let similars = constraintSimilar(to: constraint)
            
            guard let perfect = similars.perfect else {
                if let rough = similars.rough {
                    superView.removeConstraint(rough)
                }
                
                add(constraint: constraint)
                continue
            }
            
            perfect.constant = constraint.constant
        }
    }
    
    private func constraintSimilar(to visConstraint: Constraint) ->
        (rough: NSLayoutConstraint?, perfect: NSLayoutConstraint?) {
            
        var rough: NSLayoutConstraint?
        var perfect: NSLayoutConstraint?
        
        for constraint in superView.constraints {
            guard let firstItem = constraint.firstItem as? UIView,
                firstItem == view,
                constraint.firstAttribute == visConstraint.attribute,
                constraint.relation == visConstraint.relation  else {
                continue
            }
            
            rough = constraint
            
            if rough == constraint,
               constraint.multiplier == visConstraint.multiplier,
               constraint.priority   == visConstraint.priority {
               perfect = constraint
            }
        }
        return (rough, perfect)
    }
}

