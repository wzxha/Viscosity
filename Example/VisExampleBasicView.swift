//
//  VisExampleBasicView.swift
//  Example
//
//  Created by WzxJiang on 17/2/6.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

import UIKit

class VisExampleBasicView: UIView {
    
    init() {
        super.init(frame: .null)
        self.createUI()
    }
    
    func createUI() -> Void {
        let padding: CGFloat = 10.0
        
        let redView = UIView.exampleView(color: .red)
        self.addSubview(redView)
        
        let greenView = UIView.exampleView(color: .green)
        self.addSubview(greenView)
        
        let blueView = UIView.exampleView(color: .blue)
        self.addSubview(blueView)
        
        redView.vis_makeConstraints { (make) in
            make[.top, .left].equalTo(self).offset(padding)
        }
        
        greenView.vis_makeConstraints { (make) in
            make.left.equalTo(redView.vis_right).offset(padding)
            make[.right, .top].equalTo(self).offset([-padding, padding])
            make[.bottom, .width].equalTo(redView)
        }
        
        blueView.vis_makeConstraints { (make) in
            make[.left, .right, .bottom].equalTo(self).offset([padding, -padding, -padding])
            make.top.equalTo(redView.vis_bottom).offset(padding)
            make.height.equalTo(redView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

