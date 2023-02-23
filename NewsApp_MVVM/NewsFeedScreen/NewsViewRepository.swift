//
//  NewsViewRepository.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 20/02/23.
//

import Foundation

class NewsViewRepository: NewsViewRepositoryProtocol {
    var delegatee: PassNewsDataDelegate?

    var newsData = NewsResponseModel()
    var networkManager: NetworkManagerProtocol?
    
    init(networkManager: NetworkManagerProtocol?) {
        self.networkManager = networkManager
    }
    
    func fetchNewsData(completion: @escaping(NewsResponseModel?) -> Void) {
        
        let url = NewsEndPoints.baseURL
        
        networkManager?.fetchNewsData(baseURL: url,completion: { result in
            
                        switch result {
                            case .failure(let error):
                                print("Error : \(error)")
                                completion(nil)
                            case .success(let response):
                                print("Response: \(response)")
                                completion(response)
                        }
            
            
        })
        
    }
    
    func fetchDataThroughDelegate() {
        let url = NewsEndPoints.baseURL
        
        networkManager?.fetchNewsData(baseURL: url, completion: { result in
            
            switch result {
                case .success(let response):
                    print("Response: \(response)")
                self.delegatee?.passNewsDataThroughDelegate(response: response)
                
                case .failure(let error):
                    print("Error: \(error)")
                self.delegatee?.passNewsDataThroughDelegate(response: nil)
            }
        })
    }
}
