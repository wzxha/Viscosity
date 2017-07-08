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
    
    // MARK: - Add constraints
    func testAddConstraints() {
        let superView = UIView()
        
        // MARK: - .left, .right, .top, .bottom
        let view1 = UIView().then {
            superView.addSubview($0)
            $0.vis.makeConstraints {
                $0[.left, .right, .top, .bottom] == $0.superView
            }
        }
        
        test(lhs: view1.constraint(forAttribute: .top).first!.description,
             rhs: "top == \(superView) top +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view1.constraint(forAttribute: .left).first!.description,
             rhs: "left == \(superView) left +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view1.constraint(forAttribute: .right).first!.description,
             rhs: "right == \(superView) right +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view1.constraint(forAttribute: .bottom).first!.description,
             rhs: "bottom == \(superView) bottom +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        // MARK: - .edges
        let view2 = UIView().then {
            superView.addSubview($0)
            $0.vis.makeConstraints {
                $0.edges == $0.superView
            }
        }
        
        test(lhs: view2.constraint(forAttribute: .top).first!.description,
             rhs: "top == \(superView) top +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view2.constraint(forAttribute: .left).first!.description,
             rhs: "left == \(superView) left +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view2.constraint(forAttribute: .right).first!.description,
             rhs: "right == \(superView) right +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view2.constraint(forAttribute: .bottom).first!.description,
             rhs: "bottom == \(superView) bottom +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        // MARK: - .center
        let view3 = UIView().then {
            superView.addSubview($0)
            $0.vis.makeConstraints {
                $0.center == $0.superView
            }
        }
        
        test(lhs: view3.constraint(forAttribute: .centerX).first!.description,
             rhs: "centerX == \(superView) centerX +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view3.constraint(forAttribute: .centerY).first!.description,
             rhs: "centerY == \(superView) centerY +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        // MARK: - .centerX .centerY
        let view4 = UIView().then {
            superView.addSubview($0)
            $0.vis.makeConstraints {
                $0[.centerX, .centerY] == $0.superView
            }
        }
        
        test(lhs: view4.constraint(forAttribute: .centerX).first!.description,
             rhs: "centerX == \(superView) centerX +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view4.constraint(forAttribute: .centerY).first!.description,
             rhs: "centerY == \(superView) centerY +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        // MARK: - .size
        let view5 = UIView().then {
            superView.addSubview($0)
            $0.vis.makeConstraints {
                $0.size == $0.superView
            }
        }
        
        test(lhs: view5.constraint(forAttribute: .width).first!.description,
             rhs: "width == \(superView) width +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view5.constraint(forAttribute: .height).first!.description,
             rhs: "height == \(superView) height +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")

        
        // MARK: - .width .height
        let view6 = UIView().then {
            superView.addSubview($0)
            $0.vis.makeConstraints {
                $0[.width, .height] == $0.superView
            }
        }
        
        test(lhs: view6.constraint(forAttribute: .width).first!.description,
             rhs: "width == \(superView) width +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view6.constraint(forAttribute: .height).first!.description,
             rhs: "height == \(superView) height +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
    }
    
    func testConstant() {
        let superView = UIView()
        
        let view1 = UIView().then {
            superView.addSubview($0)
            $0.vis.makeConstraints {
                $0.edges == $0.superView +~ [10]
            }
        }
        
        test(lhs: view1.constraint(forAttribute: .top).first!.description,
             rhs: "top == \(superView) top +~ 10.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view1.constraint(forAttribute: .left).first!.description,
             rhs: "left == \(superView) left +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view1.constraint(forAttribute: .right).first!.description,
             rhs: "right == \(superView) right +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view1.constraint(forAttribute: .bottom).first!.description,
             rhs: "bottom == \(superView) bottom +~ 0.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        view1.vis.updateConstraints {
            $0.edges == $0.superView +~ [1, 2, 3, 4, 5]
        }
        
        test(lhs: view1.constraint(forAttribute: .top).first!.description,
             rhs: "top == \(superView) top +~ 1.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view1.constraint(forAttribute: .left).first!.description,
             rhs: "left == \(superView) left +~ 2.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view1.constraint(forAttribute: .right).first!.description,
             rhs: "right == \(superView) right +~ 4.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view1.constraint(forAttribute: .bottom).first!.description,
             rhs: "bottom == \(superView) bottom +~ 3.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        view1.vis.updateConstraints {
            $0.edges == $0.superView +~ 10
        }
        
        test(lhs: view1.constraint(forAttribute: .top).first!.description,
             rhs: "top == \(superView) top +~ 10.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view1.constraint(forAttribute: .left).first!.description,
             rhs: "left == \(superView) left +~ 10.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view1.constraint(forAttribute: .right).first!.description,
             rhs: "right == \(superView) right +~ 10.0 *~ 1.0 ~~ 1000.0 ~| true")
        
        test(lhs: view1.constraint(forAttribute: .bottom).first!.description,
             rhs: "bottom == \(superView) bottom +~ 10.0 *~ 1.0 ~~ 1000.0 ~| true")
    }
}

extension XCTestCase {
    func test<T: Comparable>(lhs: T, rhs: T, relation: (T, T) -> Bool = { $0 == $1 }) {
        XCTAssert(relation(lhs, rhs),
                  "\n********[Error]******\n\(lhs)\n        !=      \n\(rhs)\n*********************\n")
    }
}
