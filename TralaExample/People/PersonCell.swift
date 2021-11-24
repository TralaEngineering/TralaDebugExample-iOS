import Foundation
import UIKit



public class PersonCell: UITableViewCell, FillableCell {
    public func fill(with person: PersonModel) {
        textLabel?.text = person.fullName + " (" + person.state + ")"
        
        if person.state == "AK"
            || person.state == "HI" {
            contentView.backgroundColor = .yellow
        }
    }
}
