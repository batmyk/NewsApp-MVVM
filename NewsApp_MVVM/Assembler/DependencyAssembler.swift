//
//  DependencyAssembler.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 16/02/23.
//

import Foundation
import UIKit

class DependecyAssembler {
    
    static let shared = DependecyAssembler()
    
    private init() {}
    
    var networkManager: NetworkManagerProtocol?

    lazy var newsViewRepository = NewsViewRepository(networkManager: networkManager)
    
    
}

extension DependecyAssembler: NewsViewFactory {
    func makeNewsViewModel(coordinator: NewsViewCoordinator) -> NewsViewModel {
        let viewModel = NewsViewModel(repository: newsViewRepository)
        return viewModel
    }
    
    func makeNewsCoordinator(router: Router, factory: NewsViewFactory) -> NewsViewCoordinator {
        let coordinator = NewsViewCoordinator(router: router, factory: factory)
        return coordinator
    }
    
   
    func makeNewsViewController(coordinator: NewsViewCoordinator) -> NewsViewController? {
         let viewController = UIStoryboard.load(from: .main,
                                                  identifier:"NewsViewController") as? NewsViewController
        viewController!.delegate = coordinator
        viewController!.viewModel = self.makeNewsViewModel(coordinator: coordinator)
        return viewController!
            
    }
    
}
    
extension UIStoryboard {
    
   static func load(from: Bundle, identifier: String) -> UIViewController {
        
       let storyboard = UIStoryboard(name: "Main", bundle: .main)
       let vc = storyboard.instantiateViewController(withIdentifier: identifier)

        return vc
        
    }
}
