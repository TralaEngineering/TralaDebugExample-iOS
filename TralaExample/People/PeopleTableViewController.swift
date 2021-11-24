import UIKit



public class PeopleTableViewController: UITableViewController, AcceptsPeopleAPI {
    public var peopleAPI: PeopleAPI?
    private var peopleSource = ArrayDataSource<PersonModel, PersonCell>()
    
        
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = peopleSource
        let ref = UIRefreshControl()
        ref.addTarget(self, action:  #selector(reloadTable), for: .primaryActionTriggered)
        refreshControl = ref

        reloadTable()
    }
}



public extension PeopleTableViewController {
    func accept(peopleAPI: PeopleAPI) {
        self.peopleAPI = peopleAPI
    }


    @IBAction func reloadTable() {
        peopleAPI?.fetchPeople { jsonResult in
            switch jsonResult {
            case .success(let jsonData):
                let people = try! JSONDecoder().decode([PersonModel].self, from: jsonData)
                self.populateTable(with: people)
            case .failure:
                fatalError("an error happened")
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let editVC = storyboard?.instantiateViewController(withIdentifier: "EditNames") as? EditNamesViewController {
            editVC.indexPath = indexPath
            editVC.person = peopleSource.value(at: indexPath)
            editVC.delegate = self
            let nav = UINavigationController(rootViewController: editVC)
            present(nav, animated: true)
        }
    }
}



private extension PeopleTableViewController {
    func populateTable(with people: [PersonModel]) {
        refreshControl?.endRefreshing()
        peopleSource.replaceAll(with: people)
        tableView.reloadData()
    }
}



extension PeopleTableViewController: EditNamesDelegate {
    public func saveEditedPerson(_ person: PersonModel, indexPath: IndexPath) {
        peopleSource.replaceElement(at: indexPath, with: person)
        tableView.reloadData()
    }
}
