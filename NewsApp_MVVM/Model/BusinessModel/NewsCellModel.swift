//
//  NewsCellModel.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 17/02/23.
//

class NewsCellModel {
    
    var title: String?
    var description: String?
    var urlToImage: String?
    
    init(title: String?,
         description: String?,
         image: String?) {
        self.title = title
        self.description = description
        self.urlToImage = image
    }
}
