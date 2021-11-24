import XCTest
import TralaExample



class PersonCellTests: XCTestCase {
    func testFillsName() {
        let subject = PersonCell()
        let person = PersonModel(firstName: "Foo", lastName: "Bar", state: "OH")
        subject.fill(with: person)
        XCTAssertEqual(subject.textLabel?.text, "Foo Bar (OH)")
    }
    
    
    func testFillsBackground() {
        let subject = PersonCell()
        let alaskan = PersonModel(firstName: "Foo", lastName: "Bar", state: "AK")
        
        subject.fill(with: alaskan)
        XCTAssertEqual(subject.contentView.backgroundColor, .yellow)
    }
    
    
    func testDoesNotFillBackground() {
        let subject = PersonCell()
        let ohioan = PersonModel(firstName: "Foo", lastName: "Bar", state: "OH")
        
        subject.fill(with: ohioan)
        XCTAssertEqual(subject.contentView.backgroundColor, nil)
    }
}
