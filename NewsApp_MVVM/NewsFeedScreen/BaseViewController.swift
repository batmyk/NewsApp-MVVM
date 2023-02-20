//
//  BaseViewController.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 20/02/23.
//

import UIKit

protocol BaseViewControllerProtocol {
    
    func setUpUI()
}

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
    }
}
