import XCTest
@testable import Viscosity

class ViscosityTests: XCTestCase {
    func testExample() {
        let view1 = UIView()
        let view2 = UIView()
        view1.vis_makeConstraints { (make) in
            make.left==view2
        }
    }

    static var allTests : [(String, (ViscosityTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
