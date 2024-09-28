//
//  RequestStore.swift
//  Timer01
//
//  Created by Nick Rodriguez on 28/09/2024.
//

import Foundation


enum APIBase:String, CaseIterable {
    case local = "localhost"
    var urlString:String {
        switch self{
        case .local: return "http://127.0.0.1:3000/"
        }
    }
}

enum EndPoint: String {
    case gate_to_hades = "gate_to_hades"
}


class RequestStore {
    
    static let shared = RequestStore()
    var apiBase = APIBase.local

    let session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 240 // Timeout interval in seconds
        return URLSession(configuration: config)
    }()
    
    
    func callEndpoint(endPoint: EndPoint) -> URL{
        let baseURLString = apiBase.urlString + endPoint.rawValue
        let components = URLComponents(string:baseURLString)!
        return components.url!
    }
    
    
    func createRequest(endpoint:EndPoint) ->URLRequest{
        let url = callEndpoint(endPoint: endpoint)
        var request = URLRequest(url:url)
//        request.httpMethod = "POST"
        request.addValue("application/json",forHTTPHeaderField: "Content-Type")
        request.addValue("application/json",forHTTPHeaderField: "Accept")

        print("- createRequestWithToken:")
        print(request)
        return request
    }
    
    
}
