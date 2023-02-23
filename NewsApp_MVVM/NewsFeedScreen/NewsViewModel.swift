//
//  NewsViewModel.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 17/02/23.
//

import Foundation

protocol ViewModelProtocol {
    func createDataSource()
}

class NewsViewModel {
    
    var dataSource = [NewsCellModel]()
    var newsResponse: NewsResponseModel?
    
    init(repository: NewsViewRepositoryProtocol?) {
        self.newsRepository = repository
    }
    
    // all network & database request will go through repository:
    var newsRepository: NewsViewRepositoryProtocol?
    
    typealias closure = (_ response: NewsResponseModel?) -> Void
    
    func getNews(completion: @escaping(closure)) {
//        newsRepository?.fetchNewsData(completion: { response in
//
//            if let response = response {
//                self.createDataSource()
//                completion(response)
//            }
//        })
        
        newsRepository?.fetchDataThroughDelegate()
        
   }
    
    
}

extension NewsViewModel: ViewModelProtocol {
    
    func createDataSource() {
        
        if self.dataSource.count > 0 {
            self.dataSource.removeAll()
        }
        
        if let list = self.newsResponse?.articles {
            for article in list {
                                    
                self.dataSource.append(NewsCellModel(title: article.title ?? "", description: article.description ?? "",
                                                          image: article.urlToImage))
                    
                }
            }
        }
    }

