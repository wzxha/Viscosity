
//
//  VisExampleScrollView.swift
//  Example
//
//  Created by WzxJiang on 17/2/6.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

import UIKit

class VisExampleScrollView: UIView {

    init() {
        super.init(frame: .null)
        self.createUI()
    }
    
    func createUI() -> Void {
        let scrollView = UIScrollView()
        self.addSubview(scrollView)
        scrollView.vis_makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        let contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.vis_makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        var lastView: UIView? = nil
        for _ in 0...10 {
            let view = UIView.exampleView(color: UIColor.random())
            contentView.addSubview(view)
            view.vis_makeConstraints({ (make) in
                make.left.equalTo(contentView)
                if (lastView != nil) {
                    make.top.equalTo(lastView!.vis_bottom)
                } else {
                    make.top.equalTo(contentView.vis_top)
                }
                make.size.equalTo(100.0)
            })
            
            lastView = view
        }
        
        contentView.vis_makeConstraints { (make) in
            make.bottom.equalTo(lastView!)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
