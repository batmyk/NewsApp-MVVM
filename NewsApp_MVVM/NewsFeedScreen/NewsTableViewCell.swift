//
//  NewsTableViewCell.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 20/02/23.
//

import Foundation
import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var newsImgView: LazyImageView!
    
    func setData(model: NewsCellModel) {
        newsTitle.text = model.title
        newsDescription.text = model.description
//        newsImgView.loadImageWith(urlString: model.urlToImage)
        newsImgView.loadImage(fromURL: model.urlToImage ?? "", placeHolderImage: "placeholder")
        }
    
}
