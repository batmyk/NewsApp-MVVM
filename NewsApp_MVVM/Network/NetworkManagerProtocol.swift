//
//  NetworkManagerProtocol.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 20/02/23.
//

import Foundation


protocol NetworkManagerProtocol {
    
    func fetchNewsDataa(completion: @escaping (Result<NewsResponseModel, Error>) -> Void)

    
}
