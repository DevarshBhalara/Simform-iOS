//
//  ApiManager.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 14/06/23.
//

import Foundation
import Alamofire

enum APIError: Error {
    case invalidURL
    case requestFailed
    // add more as per need
}

class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    func callAPI<T: Decodable>(urlString: String, requestMethod: String = "GET", parameter: Codable? = nil ,completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestMethod
        
        switch requestMethod {
        case "GET":
            break
        case "POST":
            if let parameter = parameter {
                do {
                    urlRequest.httpBody = try JSONEncoder().encode(parameter)
                } catch let error {
                    print("Errors \(error)")
                }
                urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            }
            
            
        default:
            break
        }
        
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(APIError.requestFailed))
                return
            }
            
            guard 200...299 ~= httpResponse.statusCode else {
                completion(.failure(APIError.requestFailed))
                return
            }
            
            if httpResponse.statusCode == 204 {
                var decodedData = DeleteResponse()
                decodedData.code = httpResponse.statusCode
                decodedData.message = "Data Deleted Succesfully"
                
                guard let decodedData = decodedData as? T else {
                    completion(.failure(error!))
                    return
                }
                completion( .success(decodedData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

struct DeleteResponse: Decodable {
    var code: Int? = 0
    var message: String? = ""
}
