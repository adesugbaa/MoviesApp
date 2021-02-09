//
//  NetworkController.swift
//  MoviesApp
//
//  Created by Ayorinde Adesugba on 2/8/21.
//

import Foundation
import Combine

protocol NetworkControllerProtocol: AnyObject {
    typealias Headers = [String: Any]
    
    func get<T>(type: T.Type,
                url: URL,
                headers: Headers
    ) -> AnyPublisher<T, Error> where T: Decodable
}

final class NetworkController: NetworkControllerProtocol {
    
    func get<T: Decodable>(type: T.Type,
                           url: URL,
                           headers: Headers
    ) -> AnyPublisher<T, Error> {
        
        var urlRequest = URLRequest(url: url)
        
        headers.forEach { (key, value) in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
