//
//  Viscosity.swift
//  Viscosity
//
//  Created by WzxJiang on 16/7/21.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

import UIKit

extension UIView {
    
    func vis_makeConstraints(maker: (_: VisConstraintMaker) -> Void) -> Void {
        let make = VisConstraintMaker.init(item: self)
        maker(make)
        make.install()
    }
    
    var vis_left: VisConstraint {
        get {
            return self.setDirection(direction: .left);
        }
    }

    var vis_right: VisConstraint {
        get {
            return self.setDirection(direction: .right);
        }
    }
    
    var vis_top: VisConstraint {
        get {
            return self.setDirection(direction: .top);
        }
    }
    
    var vis_bottom: VisConstraint {
        get {
            return self.setDirection(direction: .bottom);
        }
    }
    
    var vis_width: VisConstraint {
        get {
            return self.setDirection(direction: .width);
        }
    }
    
    var vis_height: VisConstraint {
        get {
            return self.setDirection(direction: .height);
        }
    }
    
    var vis_centerX: VisConstraint {
        get {
            return self.setDirection(direction: .centerX);
        }
    }
    
    var vis_centerY: VisConstraint {
        get {
            return self.setDirection(direction: .centerY);
        }
    }
    
    private func setDirection(direction: NSLayoutAttribute) -> VisConstraint {
        let constraint = VisConstraint()
        constraint.fromItem  = self
        constraint.direction = direction
        return constraint
    }
}
