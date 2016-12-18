//
//  Viscosity.swift
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

public extension UIView {
    
    func vis_makeConstraints(_ block: (_ maker: VisConstraintMaker) -> Void) -> Void {
        let maker = VisConstraintMaker(view: self)
        maker.type = .normal
        block(maker)
        maker.install()
    }
    
    func vis_remakeConstraints(_ block: (_ maker: VisConstraintMaker) -> Void) -> Void {
        let maker = VisConstraintMaker(view: self)
        maker.type = .replace
        block(maker)
        maker.install()
    }
    
    func vis_updateConstraints(_ block: (_ maker: VisConstraintMaker) -> Void) -> Void {
        let maker = VisConstraintMaker(view: self)
        maker.type = .update
        block(maker)
        maker.install()
    }
    
    public var vis_left: VisConstraint {
        get {
            return self.constraint(attribute: .left);
        }
    }

    public var vis_right: VisConstraint {
        get {
            return self.constraint(attribute: .right);
        }
    }
    
    public var vis_top: VisConstraint {
        get {
            return self.constraint(attribute: .top);
        }
    }
    
    public var vis_bottom: VisConstraint {
        get {
            return self.constraint(attribute: .bottom);
        }
    }
    
    public var vis_leading: VisConstraint {
        get {
            return self.constraint(attribute: .leading)
        }
    }
    
    public var vis_trailing: VisConstraint {
        get {
            return self.constraint(attribute: .trailing)
        }
    }
    
    public var vis_width: VisConstraint {
        get {
            return self.constraint(attribute: .width);
        }
    }
    
    public var vis_height: VisConstraint {
        get {
            return self.constraint(attribute: .height);
        }
    }
    
    public var vis_centerX: VisConstraint {
        get {
            return self.constraint(attribute: .centerX);
        }
    }
    
    public var vis_centerY: VisConstraint {
        get {
            return self.constraint(attribute: .centerY);
        }
    }
    
    public var vis_lastBaseline: VisConstraint {
        get {
            return self.constraint(attribute: .lastBaseline)
        }
    }
    
    public var vis_center: [VisConstraint] {
        get {
            return [self.constraint(attribute: .centerX),
                    self.constraint(attribute: .centerY)]
        }
    }
    
    public var vis_edge: [VisConstraint] {
        get {
            return [self.constraint(attribute: .top),
                    self.constraint(attribute: .left),
                    self.constraint(attribute: .bottom),
                    self.constraint(attribute: .right)]
        }
    }
    
    private func constraint(attribute: NSLayoutAttribute) -> VisConstraint {
        let constraint = VisConstraint()
        constraint.toItem    = self
        constraint.attribute = attribute
        return constraint
    }
}
