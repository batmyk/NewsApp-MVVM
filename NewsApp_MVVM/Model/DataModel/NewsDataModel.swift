//
//  NewsDataModel.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 17/02/23.
//

import Foundation

struct NewsResponseModel: Codable {
    var status: String?
    var totalResult: Int?
    var articles: [Articles]?
}


struct Articles: Codable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage:String?
    var publishedAt: String?
}

struct ArticlesViewModel : Codable {
    
    var title: String?
    var description: String?
    var urlToImage:String?
}
