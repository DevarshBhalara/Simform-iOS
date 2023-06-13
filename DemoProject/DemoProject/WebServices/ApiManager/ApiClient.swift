//
//  ApiClient.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 13/06/23.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed
}

class ApiManager {
    static func request(urlString: String, requestType: String = "GET", parameter: Codable? = nil, completion: @escaping (Result<Data, APIError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType
        
        if let parameter = parameter {
            do {
                urlRequest.httpBody = try JSONEncoder().encode(parameter)
            } catch let error {
                print("Errors \(error)")
            }
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.requestFailed))
                return
            }
            completion(.success(data))
        }
        
        task.resume()
    }
}
