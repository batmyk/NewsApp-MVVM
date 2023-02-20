//
//  NetworkManager.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 20/02/23.
//

import Foundation

class NetworkManager: NetworkManagerProtocol {
    
    func fetchNewsDataa(completion: @escaping (Result<NewsResponseModel, Error>) -> Void) {
     

            guard let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2023-02-18&sortBy=publishedAt&apiKey=c0ec0d866444432397d05994eaabcf0b") else {
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
