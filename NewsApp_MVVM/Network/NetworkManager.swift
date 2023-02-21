//
//  NetworkManager.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 20/02/23.
//

import Foundation

class NetworkManager: NetworkManagerProtocol {
    
    func fetchNewsData(baseURL:String?,completion: @escaping (Result<NewsResponseModel, Error>) -> Void) {
     

        guard let stringURL = baseURL else {
            completion(.failure(APIError.invalidUrl))
            return
        }
        
        guard let url = URL(string: stringURL) else {
                completion(.failure(APIError.invalidUrl))
                return
            }
            
            let urlRequest = URLRequest(url: url, timeoutInterval: 10)
            
            URLSession.shared.dataTask(with: urlRequest) { responseData, response, error in
                
                
                if error != nil {
                    completion(.failure(APIError.failed(error: error!)))
                }
                else if let data = responseData {
                    do {
                        let news = try JSONDecoder().decode(NewsResponseModel.self, from: data)
                        print("Success!")
                        completion(.success(news))
                    }
                    catch {
                        print("Error!")
                        completion(.failure(APIError.errorDecode))
                    }
                }
                else {
                    completion(.failure(APIError.unknownError))
                }
                
            }.resume()
}


    enum APIError: Error {
        case invalidUrl
        case errorDecode
        case failed(error: Error)
        case unknownError
    }
    
}


