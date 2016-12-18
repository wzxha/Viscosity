# Viscosity 1.0
![image](https://img.shields.io/badge/Language-Swift3-blue.svg)<br/>
Autolayout framework for iOS.

<<<<<<< HEAD
# Able to do

- Support mode: normal, update and remove.
- Support All `NSLayoutAttribute`
- Support `center` and `edges`
=======
# Update Log
- Add Constraint 'Center' in 2016.12.15
- Add Constraints edge、leading、trailing、lastBaseLine in 2016.12.18
>>>>>>> ee611cbffdd13a2d718f2349e0b0b36f950d5f26

# Example

### Normal

```swift
 view.vis_makeConstraints { (make) in
   make.left.equalTo(self.view.vis_right).offset( -300)
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

### Replace

```swift
 view.vis_remakeConstraints { (make) in
   make.right.equalTo(self.view).offset(-300)
   make.bottom.equalTo(self.view).offset(30)
 }
```
# Todo
- Add more attributes like center
- ...

# If you have any suggestions
Please email to `wzxjiang@foxmail.com`<br/>

# License

The MIT License (MIT)

Copyright (c) 2016 WzxJiang

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
