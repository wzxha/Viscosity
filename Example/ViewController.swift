//
//  ViewController.swift
//  Viscosity
//
//  Created by WzxJiang on 16/7/21.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

import UIKit
import Viscosity

class ViewController: UIViewController {

    let label = UILabel()
    let greenView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        greenView.backgroundColor = UIColor.green
        self.view.addSubview(greenView)
        greenView.vis_makeConstraints { (make) in
            make.top.equalTo(self.view).offset(100)
            make.left.equalTo(self.view).offset(100)
            make.width.equalTo(200)
            make.height.equalTo(100).priority(0)
            make.height.equalTo(200).priority(1000)
        }
        
        label.text = "text..."
        label.numberOfLines = 0;
        self.view.addSubview(label)
        label.vis_makeConstraints { (make) in
            make.top.equalTo(self.view).offset(10)
            make.left.equalTo(greenView.vis_right).offset(10)
        }

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        label.vis_updateConstraints { (make) in
            make.height.equalTo(greenView)
        }
//        label.vis_remakeConstraints { (make) in
//            make.right.equalTo(self.view, offset: -300)
//            make.bottom.equalTo(self.view, offset: -30)
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

