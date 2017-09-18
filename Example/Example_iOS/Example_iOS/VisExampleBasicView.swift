//
//  VisExampleBasicView.swift
//  Example
//
//  Created by WzxJiang on 17/2/6.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

import UIKit
import Viscosity

class VisExampleBasicView: UIView {
    
    init() {
        super.init(frame: .null)
        createUI()
    }
    
    func createUI() -> Void {
        let padding: CGFloat = 10.0
        
        let redView = UIView.exampleView(color: .red)
        addSubview(redView)
        
        let greenView = UIView.exampleView(color: .green)
        addSubview(greenView)
        
        let blueView = UIView.exampleView(color: .blue)
        addSubview(blueView)
        
        redView.vis.makeConstraints { (make) in
            make[.top, .left] == self +~ padding
        }
        
        greenView.vis.makeConstraints { (make) in
            make.left == redView.vis.right +~ padding
            make[.right, .top] == self +~ [-padding, padding]
            make[.bottom, .width] == redView
        }
        
        blueView.vis.makeConstraints { (make) in
            make[.left, .right, .bottom] == self +~ [padding, -padding, -padding]
            make.top == redView.vis.bottom +~ padding
            make.height == redView
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

