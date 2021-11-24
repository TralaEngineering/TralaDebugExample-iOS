import Foundation



public struct PersonModel: Decodable {
    public var firstName: String
    public var lastName: String
    public var fullName: String { "\(firstName) \(lastName)" }
    public let state: String
    
    
    public init(firstName: String, lastName: String, state: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.state = state
    }
}
