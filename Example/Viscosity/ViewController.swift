//
//  ViewController.swift
//  Viscosity
//
//  Created by WzxJiang on 16/7/21.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let redView = UIView()
        redView.backgroundColor = UIColor.red()
        self.view.addSubview(redView)
        redView.vis_makeConstraints { (maker) in
            maker.centerX.equalTo(self.view)
            maker.centerY.equalTo(self.view)
            maker.width.equalTo(20)
            maker.height.equalTo(20)
        }
        
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blue()
        self.view.addSubview(blueView)
        blueView.vis_makeConstraints { (maker) in
            maker.left.equalTo(redView.vis_right(), offset: 10)
            maker.right.equalTo(self.view, offset: -10)
            maker.top.equalTo(redView.vis_top())
            maker.height.equalTo(redView)
        }
        
        let greenView = UIView()
        greenView.backgroundColor = UIColor.green()
        self.view.addSubview(greenView)
        greenView.vis_makeConstraints { (maker) in
            maker.left.equalTo(self.view, offset: 10)
            maker.right.equalTo(redView.vis_left(), offset: -10)
            maker.top.equalTo(redView.vis_top())
            maker.height.equalTo(redView)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

