import UIKit



public class AppNavigationController: UINavigationController, AcceptsPeopleAPI {
    public func accept(peopleAPI: PeopleAPI) {
        children.forEach { child in
            if let acceptingChild = child as? AcceptsPeopleAPI {
                acceptingChild.accept(peopleAPI: peopleAPI)
            }
        }
    }
}
