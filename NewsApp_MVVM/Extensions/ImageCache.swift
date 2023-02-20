//
//  ImageCache.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 20/02/23.
//

import Foundation
import UIKit

class LazyImageView: UIImageView
{

    private let imageCache = NSCache<AnyObject, UIImage>()

    func loadImage(fromURL imageURL: String?, placeHolderImage: String)
    {
        guard let imagUrl = imageURL else {return }
        
        self.image = UIImage(named: placeHolderImage)
        
        guard let img = URL(string: imagUrl) else {return}

        if let cachedImage = self.imageCache.object(forKey: imagUrl as AnyObject)
        {
            debugPrint("image loaded from cache for =\(imagUrl)")
            self.image = cachedImage
            return
        }

        DispatchQueue.global().async {
            [weak self] in

            if let imageData = try? Data(contentsOf: img)
            {
                debugPrint("image downloaded from server...")
                if let image = UIImage(data: imageData)
                {
                    DispatchQueue.main.async {
                        self!.imageCache.setObject(image, forKey: imageURL as AnyObject)
                        self?.image = image
                    }
                }
            }
        }
    }
}
