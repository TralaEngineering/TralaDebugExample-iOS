import XCTest
import TralaExample

class PersonModelTests: XCTestCase {
    func testInitAndProperties() {
        let subject = PersonModel(firstName: "Foo", lastName: "Bar", state: "OH")
        XCTAssertEqual(subject.firstName, "Foo")
        XCTAssertEqual(subject.lastName, "Bar")
        XCTAssertEqual(subject.fullName, "Foo Bar")
        XCTAssertEqual(subject.state, "OH")
    }
}
