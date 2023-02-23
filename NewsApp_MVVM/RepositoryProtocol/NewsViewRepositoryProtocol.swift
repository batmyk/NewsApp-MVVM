//
//  NewsViewRepositoryProtocol.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 16/02/23.
//

import Foundation

protocol NewsViewRepositoryProtocol {
    typealias closure = (_ response: NewsResponseModel?) -> Void
    
    var networkManager: NetworkManagerProtocol? { get }
    var newsData: NewsResponseModel {get}
    func fetchNewsData(completion: @escaping(closure))
    var delegatee: PassNewsDataDelegate? { get set}
    func fetchDataThroughDelegate()
}
