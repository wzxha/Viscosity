//
//  VisExampleViewController.swift
//  Example
//
//  Created by WzxJiang on 17/2/6.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

import UIKit
import Viscosity

class VisExampleViewController: UIViewController {
    
    init(title: String, cls: AnyClass) {
        super.init(nibName: nil, bundle: nil)
        
        automaticallyAdjustsScrollViewInsets = false
        
        self.view.backgroundColor = UIColor.white
        
        self.title = title
        
        let viewCls = cls as! UIView.Type
        let view = viewCls.init()
        self.view.addSubview(view)
        view.vis.makeConstraints { (make) in
            make.edges == self.view +~ UIEdgeInsetsMake(64.0, 0, 0, 0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension UIView {
    static func exampleView(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        return view
    }
}

public extension UIColor {
    static func random() -> UIColor {
        let hue = (CGFloat(arc4random()%256) / 256.0 )
        let saturation = (CGFloat(arc4random()%256) / 256.0 ) + 0.5
        let brightness = (CGFloat(arc4random()%256) / 256.0 ) + 0.5
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
}

