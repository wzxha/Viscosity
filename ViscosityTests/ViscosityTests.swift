//
//  ViscosityTests.swift
//  ViscosityTests
//
//  Created by WzxJiang on 17/1/16.
//  Copyright © 2017年 WzxJiang. All rights reserved.
//

import XCTest
import Viscosity

class ViscosityTests: XCTestCase {
        
    let container = UIView()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMakeConstraints() {
        let v1 = UIView()
        let v2 = UIView()
        self.container.addSubview(v1)
        self.container.addSubview(v2)
        
        v1.vis_makeConstraints { (make) in
            make.top.equalTo(v2.vis_top).offset(50)
            make.left.equalTo(v2.vis_top).offset(50)
        }
        
        XCTAssertEqual(self.container.constraints.count, 2,
                       "Should have 2 constraints installed")
        
        v2.vis_makeConstraints { (make) in
            make.edges.equalTo(v1)
        }
        
        XCTAssertEqual(self.container.constraints.count, 6,
                       "Should have 6 constraints installed")
    }
    
    func testUpdateConstraints() {
        let v1 = UIView()
        self.container.addSubview(v1)
        
        v1.vis_makeConstraints { (make) in
            make.top.equalTo(self.container.vis_top).offset(50)
            make.left.equalTo(self.container.vis_left).offset(50)
        }
        
        v1.vis_updateConstraints { (make) in
            make.edges.equalTo(self.container)
        }
        
        XCTAssertEqual(self.container.constraints.count, 4,
                       "Should have 4 constraints installed")
    }
    
    func testRemoveConstraints() {
        let v1 = UIView()
        self.container.addSubview(v1)
        
        v1.vis_makeConstraints { (make) in
            make.top.equalTo(self.container.vis_top).offset(50)
            make.left.equalTo(self.container.vis_top).offset(5)
            make.left.equalTo(self.container.vis_top).offset(50).priority(1)
            make.left.equalTo(self.container.vis_top).offset(500).priority(10)
            make.width.equalTo(self.container)
            make.height.equalTo(self.container)
        }
        
        v1.vis_remakeConstraints { (make) in
            make.top.equalTo(self.container)
        }
        
        XCTAssertEqual(self.container.constraints.count, 1,
                       "Should have 1 constraints installed")
    }
}

