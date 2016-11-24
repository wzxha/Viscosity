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
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blue
        self.view.addSubview(blueView)
        blueView.vis_makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        let label = UILabel()
        label.text = "text...";
        label.numberOfLines = 0;
        self.view.addSubview(label)
        label.vis_makeConstraints { (make) in
            make.left.greaterThanOrEqualTo(self.view, offset: 10)
            make.right.equalTo(blueView.vis_left, offset: -10)
            make.top.equalTo(blueView);
        }

        let greenView = UIView()
        greenView.backgroundColor = UIColor.green
        self.view.addSubview(greenView)
        greenView.vis_makeConstraints { (make) in
            make.left.equalTo(blueView.vis_right, offset: 10)
            make.bottom.equalTo(blueView.vis_top, offset: -10)
            make.height.equalTo(blueView, multiplier: 2)
            make.width.equalTo(blueView, multiplier: 1.5)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

