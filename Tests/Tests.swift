//
//  Tests.swift
//  Tests
//
//  Created by WzxJiang on 2016/12/18.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//
//  https://github.com/Wzxhaha/Viscosity
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


import XCTest
import Viscosity

class Tests: XCTestCase {
    
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
            make.left.equalTo(self.container.vis_top).offset(50)
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
