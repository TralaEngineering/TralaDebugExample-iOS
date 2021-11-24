import UIKit



public class ArrayDataSource<Value, Cell>: NSObject, UITableViewDataSource where Cell: FillableCell, Cell.Model == Value {
    private var array: [Value] = []
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        precondition(section == 0)
        return array.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Cell()
        let value = value(at: indexPath)
        cell.fill(with: value)
        return cell
    }
}



public extension ArrayDataSource {
    func replaceElement(at indexPath: IndexPath, with value: Value) {
        precondition(indexPath.row < array.count)
        array.replaceSubrange(indexPath.row...indexPath.row, with: [value])
    }
    
    
    func replaceAll(with newCollection: [Value]) {
        array = newCollection
    }
    
    
    func value(at indexPath: IndexPath) -> Value {
        precondition(indexPath.row < array.count)
        return array[indexPath.row]
    }
}

