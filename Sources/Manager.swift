//
//  Manager.swift
//  Viscosity
//
//  Created by WzxJiang on 17/7/6.
//  Copyright © 2017年 WzxJiang. All rights reserved.
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


import UIKit

public class Manager {
    internal var constraints: [Constraint] = []
    
    internal var view: UIView
    
    internal init(withView view: UIView) {
        self.view = view
    }
    
    public func makeConstraints(_ closure: (Maker) -> Void) {
        changeConstraints(type: .normal, closure: closure)
    }
    
    public func remakeConstraints(_ closure: (Maker) -> Void) {
        changeConstraints(type: .replace, closure: closure)
    }
    
    public func updateConstraints(_ closure: (Maker) -> Void) {
        changeConstraints(type: .update, closure: closure)
    }
    
    private func changeConstraints(type: Maker.InstallType, closure: (Maker) -> Void) {
        let maker = Maker(view: view, manager: self)
        closure(maker)
        maker.install(type)
    }
}
