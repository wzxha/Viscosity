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
        createUI()
    }
    
    func createUI() -> Void {
        
        let topView = UIView.exampleView(color: UIColor.blue.withAlphaComponent(0.5))
        addSubview(topView)
        topView.vis.makeConstraints { (make) in
            make[.left, .right, .top] == self
        }
        
        let bottomView = UIView.exampleView(color: UIColor.green.withAlphaComponent(0.5))
        addSubview(bottomView)
        bottomView.vis.makeConstraints { (make) in
            make[.left, .right, .bottom] == self
            make.top == topView.vis.bottom
            make.height == topView
        }
        
        let topInnerView = UIView.exampleView(color: .blue)
        topView.addSubview(topInnerView)
        topInnerView.vis.makeConstraints { (make) in
            make.size <= topView
            make.size == topView ~~ .low
            make.width == topInnerView.vis.height *~ 3
            make.center == topView
        }
        
        let bottomInnerView = UIView.exampleView(color: .green)
        bottomView.addSubview(bottomInnerView)
        bottomInnerView.vis.makeConstraints { (make) in
            make.size <= bottomView
            make.size == bottomView ~~ .low
            make.height == bottomInnerView.vis.width *~ 3
            make.center == bottomView
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
