//
//  ArticlesVC.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

final class ArticlesVC: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private properties

    private var articlesData = [Article]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadArticles()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    // MARK: - Private methods

    private func loadArticles() {
        DataLoader.loadData(decodingType: [Article].self, resourceName: "Articles") { result in
            switch result {
            case .success(let articles):
                articlesData = articles.sorted(by: { $0.id < $1.id })
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

// MARK: - TableView DataSource and Delegate

extension ArticlesVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { CGFloat(130) }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { articlesData.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleCell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.cellID) as! ArticleCell
        let article = articlesData[indexPath.row]
        articleCell.setupCellWith(title: article.title,
                                  author: article.author,
                                  imageName: article.imageName)
        return articleCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Set cell as selected
        let articleCell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.cellID) as! ArticleCell
        articleCell.isSelected = true

        // Prepare data for ArticleDetailsVC
        guard let targetVC = storyboard?.instantiateViewController(withIdentifier: "ArticleDetailsVC") as? ArticleDetailsVC else { return }

        let article = articlesData[indexPath.row]
        targetVC.setupWithData(data: article)

        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(targetVC, animated: true)
    }
}
