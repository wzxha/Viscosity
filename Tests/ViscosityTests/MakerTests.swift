import XCTest
@testable import Viscosity

class MakerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInit() {
        let view1 = UIView()
        let maker1 = Maker(manager: view1.vis)
        XCTAssert(maker1 == nil)
        
        let view2 = UIView()
        view1.addSubview(view2)
        let maker2 = Maker(manager: view2.vis)
        XCTAssert(maker2 != nil)
    }
    
    func testAddConstraints() {
        let view1 = UIView()
        
        let view2 = UIView()
        
        view1.addSubview(view2)
        
        view2.vis.makeConstraints {
            $0.edges == $0.superView
        }
        
        XCTAssert(
            view2.constraint(forAttribute: .top).first!.description
                ==
            "top == \(view1) top +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true"
        )
        
        XCTAssert(
            view2.constraint(forAttribute: .left).first!.description
                ==
            "left == \(view1) left +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true"
        )
        
        XCTAssert(
            view2.constraint(forAttribute: .right).first!.description
                ==
            "right == \(view1) right +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true"
        )
        
        XCTAssert(
            view2.constraint(forAttribute: .bottom).first!.description
                ==
            "bottom == \(view1) bottom +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true"
        )
    }
}
