//
//  VisExampleUpdateConstraintsView.swift
//  Example
//
//  Created by WzxJiang on 17/2/6.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

import UIKit
import Viscosity

class VisExampleUpdateView: UIView {

    var growingButton: UIButton!
    var buttonSize = CGSize(width: 100, height: 100)
    
    init() {
        super.init(frame: .null)
        createUI()
    }
    
    func createUI() -> Void {
        growingButton = UIButton(type: .system)
        growingButton.setTitle("Grow Me!", for: .normal)
        growingButton.layer.borderColor = UIColor.green.cgColor
        growingButton.layer.borderWidth = 3
        growingButton.addTarget(self, action: #selector(didTapGrowButton(sender:)), for: .touchUpInside)
        addSubview(growingButton)
    }
    
    override func updateConstraints() {
        growingButton.vis.updateConstraints { (make) in
            make.center == self
            make.size <= self ~~ .require
            make.size == buttonSize ~~ .high
        }
        
        super.updateConstraints()
    }
    
    @objc func didTapGrowButton(sender: UIButton) -> Void {
        buttonSize *= 1.5
        
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
        
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CGSize {
    static func *= (left: inout CGSize, scale: CGFloat) {
        left = CGSize(width: left.width*scale, height: left.height*scale)
    }
}
