# Viscosity
![image](https://img.shields.io/badge/Language-Swift3-blue.svg)<br/>
Autolayout tool for iOS.

# Example

### Normal

```swift
 view.vis_makeConstraints { (make) in
   make.left.equalTo(self.view.vis_right, offset: -300);
   make.bottom.equalTo(self.view, offset: -30);
 }
```

### Update

```swift
 view.vis_updateConstraints { (make) in
   make.left.equalTo(self.view.vis_right, offset: -300);
 }
```

### Replace

```swift
 view.vis_remakeConstraints { (make) in
   make.right.equalTo(self.view, offset: -300);
   make.bottom.equalTo(self.view, offset: -30);
 }
```
# Todo
- Add more attributes like center
- ...

## If you have any suggestions
Please email to `wzxjiang@foxmail.com`<br/>
**if where is wrong, please correct me. Thanks!**
