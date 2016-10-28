# Viscosity
![image](https://img.shields.io/badge/Language-Swift3-blue.svg)<br/>
Autolayout tool for iOS.

# Attribute
```swift
enum VisDirection: Int {
        case left
        case right
        case top
        case bottom
        case width
        case height
        case centerX
        case centerY
        case center
    }
```

# Example
```swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blue
        self.view.addSubview(blueView)
        blueView.vis_makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        let label = UILabel()
        label.text = "text..................";
        label.numberOfLines = 0;
        self.view.addSubview(label)
        label.vis_makeConstraints { (make) in
            make.left.greaterThanOrEqualTo(self.view, offset: 10)
            make.right.equalTo(blueView.vis_left, offset: -10)
            make.top.equalTo(blueView);
        }

        let greenView = UIView()
        greenView.backgroundColor = UIColor.green
        self.view.addSubview(greenView)
        greenView.vis_makeConstraints { (make) in
            make.left.equalTo(blueView.vis_right, offset: 10)
            make.bottom.equalTo(blueView.vis_top, offset: -10)
            make.height.equalTo(blueView, multiplier: 2)
            make.width.equalTo(blueView, multiplier: 1.5)
        }

    }
}
```

## If you have any suggestions
Please email to `wzxjiang@foxmail.com`<br/>
**if where is wrong, please correct me. Thanks!**
