//
//  Coordinator.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 16/02/23.
//

import Foundation

public protocol Coordinator: AnyObject {
    
    var children: [Coordinator] {get set} // Used to hold all the child coordinator under a parent coordinator.
    var router: Router { get } // Every coordinator must be having a router
    
    func present(animated:Bool, onDismissed: (() -> Void)?)
    func dismiss(animated:Bool)
    func presentChild(_ child: Coordinator,
                      animated: Bool,
                      onDismissed: (()->Void)?) // Using this method, One coordinator can communicate with other coordinators.
}

extension Coordinator {
    
    private func removeChild(_ child: Coordinator) {
        guard let index = children.firstIndex(where: {$0 === child})
        else  { return  }
        children.remove(at: index)
        
    }
    
    public func dismiss(animated:Bool) {
        router.dismiss(animated: true)
    }
    
    public func presentChild(_ child: Coordinator,
                      animated: Bool,
                      onDismissed: (()->Void)?) {
        children.append(child)
        
        child.present(animated: animated, onDismissed: { [weak self, weak child] in
            
            guard let self = self, let child = child else {
                return
            }
            
            self.removeChild(child)
            onDismissed?()
        })
    }
}
