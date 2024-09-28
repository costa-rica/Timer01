//
//  RequestFetcherStore.swift
//  Timer01
//
//  Created by Nick Rodriguez on 28/09/2024.
//

import Foundation
enum RequestFetcherStoreError: Error {
    case failedToGetResponse
}

class RequestFetcherStore{
    static let shared = RequestFetcherStore()
    
    func callGateToHades(completion:@escaping(Result<[String:Any], Error>) -> Void){
        print("- in callGateToHades")
        let request = RequestStore.shared.createRequest(endpoint: .gate_to_hades)

        let task = RequestStore.shared.session.dataTask(with: request) { data, response, error in
            guard let unwrappedData = data else {
                print("- failed to get data first")
                completion(.failure(RequestFetcherStoreError.failedToGetResponse))
                return
            }

            do {
                // Convert the data to a dictionary
                if let jsonResponse = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [String: Any] {
                    // Use the dictionary
//                    print("Dictionary: \(jsonResponse)")
                    completion(.success(jsonResponse))
                    // Now you can read values from jsonResponse using keys
                }
            } catch{
                print("- failed to get data second")
                completion(.failure(RequestFetcherStoreError.failedToGetResponse))
                return
            }
            
        }
        task.resume()
    }
}
