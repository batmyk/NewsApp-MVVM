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
    
    // all network & database request will go through repository:
    let newsRepository: NewsViewRepositoryProtocol?
    
    init(repository: NewsViewRepositoryProtocol?) {
        self.newsRepository = repository
    }
    
    typealias closure = (_ response: NewsResponseModel?,_ msg: String) -> Void
    
    func getNews(completion: @escaping(closure)) {
        newsRepository?.fetchNewsData(completion: { response, msg in
            
            if let response = response, msg == "success" {
                self.createDataSource()
                completion(response,"success")
            }
        })
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

