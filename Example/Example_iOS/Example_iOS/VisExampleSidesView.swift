//
//  VisExampleSidesView.swift
//  Example
//
//  Created by WzxJiang on 17/2/6.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

import UIKit
import Viscosity

class VisExampleSidesView: UIView {
    
    init() {
        super.init(frame: .null)
        createUI()
    }
    
    func createUI() -> Void {

        var lastView: UIView = self;
        for _ in 1...10 {
            let view = UIView.exampleView(color: UIColor.random())
            addSubview(view)
            
            view.vis.makeConstraints({ (make) in
                make.edges == lastView +~ UIEdgeInsetsMake(5, 10, 15, 20)
            })
            
            lastView = view
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
