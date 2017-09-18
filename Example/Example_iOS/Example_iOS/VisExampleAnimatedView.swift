//
//  VisExampleAnimatedView.swift
//  Example
//
//  Created by WzxJiang on 17/2/6.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

import UIKit
import Viscosity

class VisExampleAnimatedView: UIView {
    var redView: UIView!
    var greenView: UIView!
    var blueView: UIView!

    var padding: CGFloat = 10.0
    var animating = false
    
    init() {
        super.init(frame: .null)
        createUI()
    }
    
    func createUI() -> Void {
        let padding: CGFloat = 10.0
        let paddingInsets = UIEdgeInsetsMake(padding, padding, padding, padding)
        
        redView = UIView.exampleView(color: .red)
        addSubview(redView)
        
        greenView = UIView.exampleView(color: .green)
        addSubview(greenView)
        
        blueView = UIView.exampleView(color: .blue)
        addSubview(blueView)
        
        redView.vis.makeConstraints { make in
            make.edges == self +~ paddingInsets ~~ .low
            make.bottom == blueView.vis.top +~ -padding
            make.size == greenView
            make.height == blueView
        }
        
        greenView.vis.makeConstraints { make in
            make.edges == self +~ paddingInsets ~~ .low
            make.left == redView.vis.right +~ padding
            make.bottom == blueView.vis.top +~ -padding
            make.height == blueView
        }
        
        blueView.vis.makeConstraints { make in
            make.edges == self +~ paddingInsets ~~ .low
        }
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        animating = newWindow != nil;
    }
    
    override func didMoveToWindow() {
        layoutIfNeeded()
        
        if ((window) != nil) {
            animating = true
            animate(withInvertedInsets: false)
        }
    }
    
    func animate(withInvertedInsets invertedInsets: Bool) -> Void {
        if (!animating) { return }
        
        let padding = invertedInsets ? 100 : self.padding;
        let paddingInsets = UIEdgeInsetsMake(padding, padding, padding, padding)
        
        redView.vis.updateConstraints { make in
            make.edges == self +~ paddingInsets ~~ .low
            make.bottom == blueView.vis.top +~ -padding
        }
        
        greenView.vis.updateConstraints { make in
            make.left == redView.vis.right +~ padding
            make.bottom == blueView.vis.top +~ -padding
            make.edges == self +~ paddingInsets ~~ .low
        }

        
        blueView.vis.updateConstraints { make in
            make.edges == self +~ paddingInsets ~~ .low
        }

        
        UIView.animate(withDuration: 1, animations: { 
            self.layoutIfNeeded()
        }) { _ in
            self.animate(withInvertedInsets: !invertedInsets)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
