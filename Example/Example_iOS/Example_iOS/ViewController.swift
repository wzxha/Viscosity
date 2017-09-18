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
    
    let datas = [
        (title: "Basic", className: "VisExampleBasicView"),
        
        (title: "Update Constraints", className: "VisExampleUpdateView"),
            
        (title: "Remake Constraints", className: "VisExampleRemakeView"),
                 
        (title: "Aspect Fit", className: "VisExampleSidesView"),
                 
        (title: "Composite Edges", className: "VisExampleAspectFitView"),
            
        (title: "Basic Animated", className: "VisExampleAnimatedView"),
                 
        (title: "UIScrollView", className: "VisExampleScrollView")
    ]
    
    override func viewDidLoad() {
        self.createUI()
    }
    
    func createUI() -> Void {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ExampleCell")
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let clsName = datas[indexPath.row].className
        
        let cls: AnyClass = NSClassFromString("Example_iOS." + clsName)!
        
        self.navigationController?.pushViewController(VisExampleViewController(title: datas[indexPath.row].title, cls: cls), animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = datas[indexPath.row].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "ExampleCell")!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
}

