//
//  VisExampleAspectFitView.swift
//  Example
//
//  Created by WzxJiang on 17/2/6.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

import UIKit
import Viscosity

class VisExampleAspectFitView: UIView {

    init() {
        super.init(frame: .null)
        self.createUI()
    }
    
    func createUI() -> Void {
        
        let topView = UIView.exampleView(color: UIColor.blue.withAlphaComponent(0.5))
        self.addSubview(topView)
        topView.vis_makeConstraints { (make) in
            make[.left, .right, .top] == self
        }
        
        let bottomView = UIView.exampleView(color: UIColor.green.withAlphaComponent(0.5))
        self.addSubview(bottomView)
        bottomView.vis_makeConstraints { (make) in
            make[.left, .right, .bottom] == self
            make.top == topView.vis_bottom
            make.height == topView
        }
        
        let topInnerView = UIView.exampleView(color: .blue)
        topView.addSubview(topInnerView)
        topInnerView.vis_makeConstraints { (make) in
            make.size <= topView
            (make.size == topView).priority(UILayoutPriorityDefaultLow)
            (make.width == topInnerView.vis_height).multiplier(3)
            make.center == topView
        }
        
        let bottomInnerView = UIView.exampleView(color: .green)
        bottomView.addSubview(bottomInnerView)
        bottomInnerView.vis_makeConstraints { (make) in
            make.size <= bottomView
            (make.size == bottomView).priority(UILayoutPriorityDefaultLow)
            (make.height == bottomInnerView.vis_width).multiplier(3)
            make.center == bottomView
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
