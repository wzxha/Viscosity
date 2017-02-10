//
//  VisExampleAspectFitView.swift
//  Example
//
//  Created by WzxJiang on 17/2/6.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

import UIKit

class VisExampleAspectFitView: UIView {

    init() {
        super.init(frame: .null)
        self.createUI()
    }
    
    func createUI() -> Void {
        
        let topView = UIView.exampleView(color: UIColor.blue.withAlphaComponent(0.5))
        self.addSubview(topView)
        topView.vis_makeConstraints { (make) in
            make[.left, .right, .top].equalTo(self)
        }
        
        let bottomView = UIView.exampleView(color: UIColor.green.withAlphaComponent(0.5))
        self.addSubview(bottomView)
        bottomView.vis_makeConstraints { (make) in
            make[.left, .right, .bottom].equalTo(self)
            make.top.equalTo(topView.vis_bottom)
            make.height.equalTo(topView)
        }
        
        let topInnerView = UIView.exampleView(color: .blue)
        topView.addSubview(topInnerView)
        topInnerView.vis_makeConstraints { (make) in
            make.size.lessThanOrEqualTo(topView)
            make.size.equalTo(topView).priority(UILayoutPriorityDefaultLow)
            make.width.equalTo(topInnerView.vis_height).multiplier(3)
            make.center.equalTo(topView)
        }
        
        let bottomInnerView = UIView.exampleView(color: .green)
        bottomView.addSubview(bottomInnerView)
        bottomInnerView.vis_makeConstraints { (make) in
            make.size.lessThanOrEqualTo(bottomView)
            make.size.equalTo(bottomView).priority(UILayoutPriorityDefaultLow)
            make.height.equalTo(bottomInnerView.vis_width).multiplier(3)
            make.center.equalTo(bottomView)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
