import Foundation


public class PeopleFetcher: PeopleAPI {
    public func fetchPeople(completion: @escaping (_ jsonResult: Result<Data, Error>)->Void) {
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + .seconds(1)) {
            do {
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
