//
//  ApiManagerAF.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 15/06/23.
//

import Foundation
import Alamofire
class ApiManagerAF {
    static let shared = ApiManagerAF()
    
    static var storeUrl = "https://fakestoreapi.com/"
    
    private init() { }
    
    func callAPI<T: Codable>(urlString: String, method: HTTPMethod, parameter: Parameters? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        
        if let url = URL(string: urlString) {
            
            AF.request(url, method: method, parameters: parameter, encoding: JSONEncoding.default).validate().responseDecodable(of: T.self) {
                response in
                
                if let error = response.error {
                    completion(.failure(error))
                }

                
                guard let responseData = response.response else {
                    completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                    return
                }
                
                guard 200...299 ~= responseData.statusCode else {
                    completion(.failure(APIError.requestFailed))
                    return
                }
                
                switch response.result {
                case .success(let result):
                    completion(.success(result))
                case .failure(let error) :
                    completion(.failure(error))
                }
            }
        }
        
        
    }
}
