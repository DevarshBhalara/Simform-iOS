//
//  APIManager.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 16/06/23.
//

import Foundation
import Alamofire

class APIManagerDemo {
    
    init() { }
    
    private let sessionManager: Session = Session()
    static var shared = APIManagerDemo()
    
    func call<T>(type: RequestItemsType, params: Parameters? = nil, handler: @escaping (Result<T, CustomError>) -> Void) where T: Codable {
        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: params,
                                    encoding: type.encoding).validate().responseData {
            (data) in
            print(type.url)
            if self.handleResponseCode(res: data) {
                do {
                    guard let jsonData = data.data else {
                        //handle
                        return
                    }
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    print("JSON Data \(jsonData)")
                    let result = try jsonDecoder.decode(T.self, from: jsonData)
                    
                    handler(.success(result))
                    
                } catch {
                    print("Error \(error)")
                    handler(.failure(.init(title: "AppName", body: "Server side error Please try again")))
                }
            } else {
                handler(.failure(CustomError(title: "Appname", body: "")))
            }
        }
    }
    
    func callUploadApi<T>(type: RequestItemsType, image: UIImage ,params: Parameters? = nil, handler: @escaping (Result<T, CustomError>) -> Void, progress: @escaping (Progress) -> Void) where T: Codable {
        
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            handler(.failure(.init(title: "Appname", body: "Image not found")))
            return
        }
        
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpeg")
        }, to: type.url)
        .responseData { response in
            print(response)
            
            guard let data = response.data else {
                handler(.failure(.init(title: "AppName", body: "Data not Found")))
                return
            }
            
            if self.handleResponseCode(res: response) {
                do {
                    let response = try JSONDecoder().decode(T.self, from: data)
                    print(response)
                    handler(.success(response))
                } catch let error {
                    handler(.failure(.init(title: "AppNmae", body: "Not able to response \(error)")))
                }
            }
        }.uploadProgress {
            progressCount in
            progress(progressCount)
        }
    }
    
    func downloadAndSaveImage(url: String, destinationPath: String, completion: @escaping (URL?, Error?) -> Void, progress: @escaping (Progress) -> Void) {
        AF.download(url).responseData { response in
            switch response.result {
            case .success(let data):
                let fileURL = URL(fileURLWithPath: destinationPath)
                do {
                    try data.write(to: fileURL)
                    
                    completion(fileURL, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }.downloadProgress {
            progressCount in
            print("Download \(progressCount.fractionCompleted)")
            progress(progressCount)
        }
    }
    
    
    //Handle Response
    private func handleResponseCode(res: AFDataResponse<Data>?) -> Bool {
        var isSuccess: Bool = false
        
        guard let dataResponse = res else {
            return isSuccess
        }
        guard let response = dataResponse.response else {
            return isSuccess
        }
        
        switch response.statusCode {
        case 200...300:
            isSuccess = true
        default: break
        }
        
        return isSuccess
    }
    
}
