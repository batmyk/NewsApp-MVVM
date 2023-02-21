//
//  Router.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 16/02/23.
//

import Foundation
import UIKit

/**
 Router will do the actual Navigation.
 **/


public protocol Router: AnyObject {
    
    func present(_ viewController: UIViewController, animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, onDismissed:(()->Void)?)
    
    func dismiss(animated: Bool) // To dismiss entire router
    
    func setRootViewController(_ viewController: UIViewController)
    func setRootViewController(_ viewController: UIViewController, hideBar: Bool)
    
    
}


extension Router {
    
    public func present(_ viewController: UIViewController, animated:Bool) {
        
        present(viewController, animated: true, onDismissed: nil)
    }
}
