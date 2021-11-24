import Foundation



public protocol EditNamesDelegate: AnyObject {
    func saveEditedPerson(_ person: PersonModel, indexPath: IndexPath)
}
