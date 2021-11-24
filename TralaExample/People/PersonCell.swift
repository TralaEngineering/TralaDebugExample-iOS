import Foundation
import UIKit



public class PersonCell: UITableViewCell, FillableCell {
    public func fill(with person: PersonModel) {
        textLabel?.text = person.fullName + " (" + person.state + ")"        
    }
}
