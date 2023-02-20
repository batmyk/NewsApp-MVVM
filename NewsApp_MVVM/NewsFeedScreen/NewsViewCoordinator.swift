//
//  NewsViewCoordinator.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 17/02/23.
//

import Foundation


protocol NewsViewControllerDelegate {
    func navigateToNextScreen(_ viewController: NewsViewController)
}

public class NewsViewCoordinator: Coordinator {

    public var children: [Coordinator] = []
    public var router: Router
    private let factory: NewsViewFactory
    
    init(router: Router, factory: NewsViewFactory) {
        self.router = router
        self.factory = factory
    }
    
    public func present(animated: Bool, onDismissed: (() -> Void)?) {
        if let newsViewController = factory.makeNewsViewController(coordinator: self) {
            router.present(newsViewController,
                           animated: true,
                           onDismissed: nil)
        }
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        
    }
    
    func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        
    }
    
    func removeAllChildCoordinators() {
        
    }

}

extension NewsViewCoordinator: NewsViewControllerDelegate {
    func navigateToNextScreen(_ viewController: NewsViewController) {
        if let navCotroller = viewController.navigationController {
            let router = NavigationRouter(navigationController: navCotroller)
            let assembler = DependecyAssembler.shared
            let coordinator = assembler.makeNewsCoordinator(router: router, factory: factory)
            presentChild(coordinator,
                         animated: true,
                         onDismissed: nil)
        }
    }
}
