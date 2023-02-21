//
//  TestData.swift
//  NewsApp_MVVMTests
//
//  Created by Mayank on 21/02/23.
//

import Foundation
import UIKit
@testable import NewsApp_MVVM

struct TestData {
    
    struct Article {
        static let articleFirst = NewsCellModel(title: "First Article", description: "Description for first Article", image: "")
        static let articleSecond = NewsCellModel(title: "Second Article", description: "Description for second Article", image: "")
        static let articleThird = NewsCellModel(title: "Third Article", description: "Description for third Article", image: "")
    }
    
    struct API_URLs {
        
        static let validURL = "https://newsapi.org/v2/everything?q=tesla&from=2023-02-18&sortBy=publishedAt&apiKey=c0ec0d866444432397d05994eaabcf0b"
        static let invalidURL = "https://newsapi.org/v2/everything?q=tesla&from=2022-02-18&sortBy=publishedAt&apiKey=c0ec0d866444432397d05994eaabcf0b" // If date is older in the parameter, Link won't work.

        
    }
    
}
