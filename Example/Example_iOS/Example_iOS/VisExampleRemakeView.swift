//
//  VisExampleRemakeView.swift
//  Example
//
//  Created by WzxJiang on 17/2/6.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

import UIKit
import Viscosity

class VisExampleRemakeView: UIView {

    var movingButton: UIButton!
    var isLeft = true
    
    init() {
        super.init(frame: .null)
        createUI()
    }
    
    func createUI() -> Void {
        movingButton = UIButton(type: .system)
        movingButton.setTitle("Moving Me!", for: .normal)
        movingButton.layer.borderColor = UIColor.green.cgColor
        movingButton.layer.borderWidth = 2
        movingButton.addTarget(self, action: #selector(didTapMovingButton(sender:)), for: .touchUpInside)
        addSubview(movingButton)
    }
    
    override func updateConstraints() {
        movingButton.vis.remakeConstraints { (make) in
            make.width == 100.0
            make.height == 100.0
            if (isLeft) {
                make[.left, .top] == self +~ 10
            } else {
                make[.bottom, .right] == self +~ -10
            }
        }
        
        super.updateConstraints()
    }
    
    @objc func didTapMovingButton(sender: UIButton) -> Void {
        isLeft = !isLeft
        
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
