# Viscosity 1.0
![swift version](https://img.shields.io/badge/Language-Swift3-blue.svg)
[![travis-ci](https://travis-ci.org/Wzxhaha/Viscosity.svg?branch=master)](https://travis-ci.org/Wzxhaha/Viscosity)
<br/>
Autolayout framework for iOS, simple and powerful.

# Requirements
- iOS 8.0+ 
- Xcode 8.0+
- Swift 3.0+

# Able to do
- Support mode: normal, update and remake.
- Support All `NSLayoutAttribute`
- Support `center` and `edges`
- And a lot of powerful usage, You can look at the `examples` in the file

# Usage

### Normal

```swift
 view.vis_makeConstraints { (make) in
   make.left.equalTo(self.view.vis_right).offset(-300)
   make.right.greaterThanOrEqualTo(self.view). multiplier(2).offset(10)
   make.bottom.equalTo(self.view).offset(-10)
   make.height.lessThanOrEqualTo(10)
   make.height.lessThanOrEqualTo(100).priority(10)
 }
```

### Update

```swift
 view.vis_updateConstraints { (make) in
   make.left.equalTo(self.view.vis_right).offset(-100)
 }
```

### Remake
```swift
 view.vis_remakeConstraints { (make) in
   make.right.equalTo(self.view).offset(-300)
   make.bottom.equalTo(self.view).offset(30)
 }
```

# Contact me
Email: `wzxjiang@foxmail.com`

# License
Viscosity is released under the MIT license. See LICENSE for details.
