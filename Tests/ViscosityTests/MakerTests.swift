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
        
    }
}

extension XCTestCase {
    func test<T: Comparable>(lhs: T, rhs: T, relation: (T, T) -> Bool = { $0 == $1 }) {
        XCTAssert(relation(lhs, rhs),
                  "********[Error]******\n\(lhs)\n!=\(rhs)\n*******************\n")
    }
}
