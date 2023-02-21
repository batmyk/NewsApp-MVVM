//
//  ViewController.swift
//  NewsApp_MVVM
//
//  Created by Mayank on 16/02/23.
//

import UIKit

protocol HomeViewControllerDelegate {
    func navigateToNextScreen(_ viewController: NewsViewController)
}

class NewsViewController: BaseViewController {

    var viewModel: NewsViewModel?
    var delegate: NewsViewControllerDelegate?
    var articles =  [Articles]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                
                self?.newsTableView.reloadData()
            }
        }
    }

    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        fetchNewsData()
    }

    func fetchNewsData() {
        
        viewModel?.getNews(completion: { response in
            if let response = response {
                self.articles = response.articles ?? []
            }
        })
    }

}

extension NewsViewController: BaseViewControllerProtocol {
    
    func setUpUI() {
        self.title = "MVVM-CA: News App"
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.tableFooterView = UIView(frame: .zero)
        newsTableView.backgroundColor = .clear
        newsTableView.separatorColor = UIColor.white
        newsTableView.reloadData()
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return (self.viewModel?.dataSource.count ?? 0 > 0) ? 3 : 0
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else { return NewsTableViewCell() }
        
            let article = articles[indexPath.row]
            let newsCellModel = NewsCellModel(title: article.title, description: article.description, image: article.urlToImage)
            cell.setData(model: newsCellModel)
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }
}
