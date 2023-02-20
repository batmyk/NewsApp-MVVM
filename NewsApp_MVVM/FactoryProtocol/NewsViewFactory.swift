//
//  NewsViewFactory.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 16/02/23.
//

import Foundation

protocol NewsViewFactory {
    
    func makeNewsViewModel(coordinator: NewsViewCoordinator) -> NewsViewModel
    func makeNewsViewController(coordinator: NewsViewCoordinator) -> NewsViewController?
    
    func makeNewsCoordinator(router: Router, factory: NewsViewFactory) -> NewsViewCoordinator
}
