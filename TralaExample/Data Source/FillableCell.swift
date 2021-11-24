import UIKit


public protocol FillableCell: UITableViewCell {
    associatedtype Model
    func fill(with: Model)
}
