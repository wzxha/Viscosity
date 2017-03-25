import UIKit

func makeConstraintsNormalTest() {
    let container = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    let view = UIView()
    view.vis_makeConstraints { (make) in
        make.left.description
    }
}
