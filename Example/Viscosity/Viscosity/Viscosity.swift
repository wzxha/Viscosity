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
    
    func vis_left() -> VisConstraint{
        return self.setDirection(direction: .left);
    }
    
    func vis_right() -> VisConstraint{
        return self.setDirection(direction: .right);
    }
    
    func vis_top() -> VisConstraint{
        return self.setDirection(direction: .top);
    }
    
    func vis_bottom() -> VisConstraint{
        return self.setDirection(direction: .bottom);
    }
    
    func vis_width() -> VisConstraint{
        return self.setDirection(direction: .width);
    }
    
    func vis_height() -> VisConstraint{
        return self.setDirection(direction: .height);
    }
    
    func vis_centerX() -> VisConstraint{
        return self.setDirection(direction: .centerX);
    }
    
    func vis_centerY() -> VisConstraint{
        return self.setDirection(direction: .centerY);
    }
    
    
    private func setDirection(direction: NSLayoutAttribute) -> VisConstraint {
        let constraint = VisConstraint()
        constraint.fromItem  = self
        constraint.direction = direction
        return constraint
    }
}
