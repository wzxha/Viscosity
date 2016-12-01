//
//  Viscosity.swift
//  Viscosity
//
//  Created by WzxJiang on 16/7/21.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

import UIKit

extension UIView {
    
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
    
    var vis_left: VisConstraint {
        get {
            return self.constraint(attribute: .left);
        }
    }

    var vis_right: VisConstraint {
        get {
            return self.constraint(attribute: .right);
        }
    }
    
    var vis_top: VisConstraint {
        get {
            return self.constraint(attribute: .top);
        }
    }
    
    var vis_bottom: VisConstraint {
        get {
            return self.constraint(attribute: .bottom);
        }
    }
    
    var vis_width: VisConstraint {
        get {
            return self.constraint(attribute: .width);
        }
    }
    
    var vis_height: VisConstraint {
        get {
            return self.constraint(attribute: .height);
        }
    }
    
    var vis_centerX: VisConstraint {
        get {
            return self.constraint(attribute: .centerX);
        }
    }
    
    var vis_centerY: VisConstraint {
        get {
            return self.constraint(attribute: .centerY);
        }
    }
    
    private func constraint(attribute: NSLayoutAttribute) -> VisConstraint {
        let constraint = VisConstraint()
        constraint.toItem    = self
        constraint.attribute = attribute
        return constraint
    }
}
