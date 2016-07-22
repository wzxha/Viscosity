# Viscosity
A Swift3.0 Autolayout tool for iOS.

```swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let redView = UIView()
        self.view.addSubview(redView)
        redView.vis_makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        let blueView = UIView()
        self.view.addSubview(blueView)
        blueView.vis_makeConstraints { (make) in
            make.left.equalTo(redView.vis_right, offset: 10)
            make.right.equalTo(self.view, offset: -10)
            make.top.equalTo(redView.vis_top)
            make.height.equalTo(redView)
        }
    }
}
```

## If you have any suggestions
Please email to `wzxjiang@foxmail.com`<br/>
**if where is wrong, please correct me. Thanks!**
