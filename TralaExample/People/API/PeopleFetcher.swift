import Foundation

public class PeopleFetcher: PeopleAPI {
    private var requestCount = 0
    
    
    public func fetchPeople(completion: @escaping (_ jsonResult: Result<Data, Error>)->Void) {
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            do {
                self?.requestCount += 1
                if self?.requestCount.isMultiple(of: 5) == true {
                    throw NSError(domain: URLError.errorDomain, code: URLError.badServerResponse.rawValue, userInfo: [
                        NSLocalizedDescriptionKey: "There was an error communicating with the server."
                    ])
                }
                
                guard let url = Bundle.main.url(forResource: "fake", withExtension: "json") else {
                    throw NSError(domain: URLError.errorDomain, code: URLError.cannotDecodeContentData.rawValue, userInfo: [
                        NSLocalizedDescriptionKey: "Cannot read static JSON."
                    ])
                }
 
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    completion(.success(data))
                }

            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
