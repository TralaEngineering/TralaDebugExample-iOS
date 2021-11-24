import XCTest
import TralaExample



class PersonCellTests: XCTestCase {
    func testFillsName() {
        let subject = PersonCell()
        let person = PersonModel(firstName: "Foo", lastName: "Bar", state: "OH")
        subject.fill(with: person)
        XCTAssertEqual(subject.textLabel?.text, "Foo Bar (OH)")
    }
}
