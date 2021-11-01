//
//  NetworkManager.swift
//  NetworkManager
//
//  Created by Sanjeev Kumar on 31/10/21.
//

import Foundation

public enum HTTPRequestType: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}
class NetworkManager: NSObject {
    
    let session = URLSession.shared
    func makeServerRequest<ResponseType: Codable>(responseType: ResponseType.Type, urlStr: String, requestType: HTTPRequestType = .get, completionHandler: @escaping((Result<ResponseType, Error>) -> Swift.Void)) {
        guard let url = URL.init(string: urlStr) else {
            return
        }
        var urlRequest = URLRequest.init(url: url)
        urlRequest.httpMethod = requestType.rawValue
        let task = session.dataTask(with: urlRequest) { responseData, response, error in
            guard let listData = responseData, let data = String(decoding: listData, as: UTF8.self).data(using: .utf8), error == nil else {
                DispatchQueue.main.async {
                    completionHandler(.failure(error!))
                }
                return
                
            }
            
            do {
                let model = try JSONDecoder().decode(responseType, from: listData)
                DispatchQueue.main.async {
                    completionHandler(.success(model))
                }
            } catch let error as NSError {
                print("Error in parsing: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
        }
        task.resume()
        
    }
    
    //Download data from url
    func downloadImageData(urlString: URL, completionHandler: @escaping((Result<Data, Error>) -> Swift.Void)) {
        let urlRequest = URLRequest.init(url: urlString)
        let task = session.dataTask(with: urlRequest) { responseData, response, error in
            //, let data = String(decoding: listData, as: UTF8.self).data(using: .utf8)
            guard let listData = responseData, error == nil else {
                completionHandler(.failure(error!))
                return
            }
            
            completionHandler(.success(listData))
            
        }
        task.resume()
        
    }
}

