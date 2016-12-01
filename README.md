# Viscosity
![image](https://img.shields.io/badge/Language-Swift3-blue.svg)<br/>
Autolayout tool for iOS.

# Example

### Normal

```swift
 view.vis_makeConstraints { (make) in
   make.left.equalTo(self.view.vis_right, offset: -300)
   make.right.greaterThanOrEqualTo(self.view, multiplier: 2, offset: 0)
   make.height.lessThanOrEqualTo(30)
   make.bottom.equalTo(self.view, offset: -30)
 }
```

### Update

```swift
 view.vis_updateConstraints { (make) in
   make.left.equalTo(self.view.vis_right, offset: -300)
 }
```

### Replace

```swift
 view.vis_remakeConstraints { (make) in
   make.right.equalTo(self.view, offset: -300)
   make.bottom.equalTo(self.view, offset: -30)
 }
```
# Todo
- Add more attributes like center
- ...

# If you have any suggestions
Please email to `wzxjiang@foxmail.com`<br/>
**if where is wrong, please correct me. Thanks!**

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
