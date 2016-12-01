//
//  ViewController.swift
//  Viscosity
//
//  Created by WzxJiang on 16/7/21.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let label = UILabel()
    let greenView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "text...";
        label.numberOfLines = 0;
        self.view.addSubview(label)
        label.vis_makeConstraints { (make) in
            make.left.equalTo(self.view, offset: 100)
            make.top.equalTo(self.view, offset: 100);
            make.height.equalTo(10)
        }

        greenView.backgroundColor = UIColor.green
        self.view.addSubview(greenView)
        greenView.vis_makeConstraints { (make) in
            make.left.equalTo(label.vis_right, offset: 10)
            make.top.equalTo(label.vis_bottom, offset: -10)
            make.height.equalTo(100)
            make.width.equalTo(label, multiplier: 1.5)
        }
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        label.vis_updateConstraints { (make) in
            make.height.equalTo(greenView);
        }
//        label.vis_remakeConstraints { (make) in
//            make.right.equalTo(self.view, offset: -300);
//            make.bottom.equalTo(self.view, offset: -30);
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

