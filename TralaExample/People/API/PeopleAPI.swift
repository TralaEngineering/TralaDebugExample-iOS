import Foundation



public protocol PeopleAPI {
    func fetchPeople(completion: @escaping (Result<Data,Error>)->Void)
}
