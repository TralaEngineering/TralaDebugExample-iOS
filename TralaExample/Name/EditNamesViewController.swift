import UIKit




public class EditNamesViewController: UIViewController {
    @IBOutlet private weak var firstName: UITextField!
    @IBOutlet private weak var lastName: UITextField!
    public var person: PersonModel?
    public var indexPath: IndexPath?
    public var delegate: EditNamesDelegate?
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        firstName.text = person?.firstName
        lastName.text = person?.lastName
    }
}



private extension EditNamesViewController {
    @IBAction func saveTapped() {
        guard
            let someDelegate = delegate,
            let somePerson = person,
            let someIndexPath = indexPath
        else { return }
        
        someDelegate.saveEditedPerson(somePerson, indexPath: someIndexPath)
        cancelTapped()
    }
    
    
    @IBAction func cancelTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func firstNameChanged() {
        person?.firstName = firstName.text ?? ""
    }
    
    
    @IBAction func lastNameChanged() {
        person?.lastName = lastName.text ?? ""
    }
}

