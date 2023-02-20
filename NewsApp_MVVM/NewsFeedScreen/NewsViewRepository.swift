//
//  NewsViewRepository.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 20/02/23.
//

import Foundation

class NewsViewRepository: NewsViewRepositoryProtocol {
    
    func fetchNewsData(completion: @escaping(NewsResponseModel?, String) -> Void) {
        
//        networkManager?.fetchNewsData(completion: { response in
//            if let response = response {
//                completion(response, "success")
//            }
//        })
        
        networkManager?.fetchNewsDataa(completion: { result in
            
                        switch result {
                            case .failure(let error):
                                print("Error : \(error)")
                                completion(nil,"error")
                            case .success(let response):
                                print("Response: \(response)")
                                completion(response,"success")
                        }
            
            
        })
        
    }
    
    
    

//    func fetchNewsData(completion: closure) {
//
//        networkManager?.fetchNewsData(completion: { result in
//
//
//
////            switch result {
////            case .failure(let error):
////                print("Error : \(error)")
////                completion(error,"Error")
////                completion(error)
////            case .success(let response):
////                print("Response: \(response)")
////                completion(response)
////            }
//        })
//    }
    
    
    
    var newsData = NewsResponseModel()
    
//    func fetchNewsDataa(completion: NewsResponseModel) {
//        networkManager?.fetchNewsData(completion: { result in
//
//            switch result {
//            case .failure(let error):
//                print("Error : \(error)")
//                completion(error)
//            case .success(let response):
//                print("Response: \(response)")
//                completion(response)
//            }
//        })
//    }
    
    var networkManager: NetworkManagerProtocol?
    init(networkManager: NetworkManagerProtocol?) {
        self.networkManager = networkManager
    }
    
    
}
