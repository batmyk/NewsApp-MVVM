//
//  AppDelegateRouter.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 17/02/23.
//

import UIKit

public class AppDelegateRouter: Router {
    
    public let window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: Router protocol:
    public func present(_ viewController: UIViewController,
                        animated: Bool,
                        onDismissed: (() -> Void)?) {
        let navController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
    
    public func dismiss(animated: Bool) {
        // App delegate contains this Router so it cant be dismissed.
    }
    
    public func setRootViewController(_ viewController: UIViewController) {
        
    }
    
    public func setRootViewController(_ viewController: UIViewController, hideBar: Bool) {
        
    }
}
