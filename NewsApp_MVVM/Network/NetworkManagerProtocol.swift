//
//  NetworkManagerProtocol.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 20/02/23.
//

import Foundation


protocol NetworkManagerProtocol {
    
    func fetchNewsData(baseURL:String?, completion: @escaping (Result<NewsResponseModel, Error>) -> Void)

    
}
