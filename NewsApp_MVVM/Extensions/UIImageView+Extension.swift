//
//  UIImageView+Extension.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 20/02/23.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImageWith(urlString: String?) {
        
        guard let urlStr = urlString else {
            return
        }
        
        if let url = URL(string: urlStr){

            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let imgData = data {
                        self.image = UIImage(data: imgData)
                    }

                }
            }
        }
    }
    
    func makeCircularWith(bgColor: UIColor,
                          cornerRadius: CGFloat,
                          borderWidth: CGFloat,
                          borderColor: UIColor,
                          interactionEnabled: Bool) {
        self.backgroundColor = bgColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.isUserInteractionEnabled = interactionEnabled
        self.clipsToBounds = true
    }
}
