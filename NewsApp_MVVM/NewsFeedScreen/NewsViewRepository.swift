//
//  NewsViewRepository.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 20/02/23.
//

import Foundation

class NewsViewRepository: NewsViewRepositoryProtocol {

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
}
