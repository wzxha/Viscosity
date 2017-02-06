//
//  ViewController.swift
//  Viscosity
//
//  Created by WzxJiang on 16/7/21.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

import UIKit
import Viscosity

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    let datas = [["title": "Basic",
                  "class": "VisExampleBasicView"],
                 
                 ["title": "Update Constraints",
                  "class": "VisExampleUpdateView"],
                 
                 ["title": "Remake Constraints",
                  "class": "VisExampleRemakeView"],
                 
                 ["title": "Aspect Fit",
                  "class": "VisExampleSidesView"],
                 
                 ["title": "Composite Edges",
                  "class": "VisExampleAspectFitView"],
                 
                 ["title": "Basic Animated",
                  "class": "VisExampleAnimatedView"],
                 
                 ["title": "UIScrollView",
                  "class": "VisExampleScrollView"]]
    
    override func viewDidLoad() {
        self.createUI()
    }
    
    func createUI() -> Void {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "ExampleCell")
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let clsName = datas[indexPath.row]["class"] else {
            return
        }
        
        let cls: AnyClass = NSClassFromString("Example." + clsName)!
        
        self.navigationController?.pushViewController(VisExampleViewController.init(title: datas[indexPath.row]["title"]!, cls: cls), animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = datas[indexPath.row]["title"]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "ExampleCell")!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

