
//
//  VisExampleScrollView.swift
//  Example
//
//  Created by WzxJiang on 17/2/6.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

import UIKit
import Viscosity

class VisExampleScrollView: UIView {

    init() {
        super.init(frame: .null)
        createUI()
    }
    
    func createUI() -> Void {
        let scrollView = UIScrollView()
        addSubview(scrollView)
        scrollView.vis.makeConstraints { (make) in
            make.edges == self
        }
        
        let contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.vis.makeConstraints { (make) in
            make.edges == scrollView
            make.width == scrollView
        }
        
        var lastView: UIView? = nil
        for _ in 0...10 {
            let view = UIView.exampleView(color: UIColor.random())
            contentView.addSubview(view)
            view.vis.makeConstraints({ (make) in
                make.left == contentView
                if lastView != nil {
                    make.top == lastView!.vis.bottom
                } else {
                    make.top == contentView.vis.top
                }
                make.size == 100.0
            })
            
            lastView = view
        }
        
        contentView.vis.makeConstraints { (make) in
            make.bottom == lastView!
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
