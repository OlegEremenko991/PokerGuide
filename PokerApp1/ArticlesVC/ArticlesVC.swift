//
//  ArticlesVC.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

final class ArticlesVC: UIViewController {

// MARK: IBOutlets

    @IBOutlet private weak var tableView: UITableView!
    
// MARK: Private properties

    private let articleCellID = "ArticleCellID"
    private let articlesData = DataLoader().articles
    
// MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true) // Show navigation bar
    }
    
}

// MARK: TableView DataSource and Delegate

extension ArticlesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(130)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleCell = tableView.dequeueReusableCell(withIdentifier: articleCellID) as! ArticleCell
        let article = articlesData[indexPath.row]
        
        articleCell.articleTitleLabel.text = article.title
        articleCell.articleAuthorLabel.text = article.author
        articleCell.articleImageView.image = UIImage(named: article.imageName)
        
        return articleCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        // Set cell as selected

        let articleCell = tableView.dequeueReusableCell(withIdentifier: articleCellID) as! ArticleCell
        articleCell.isSelected = true
        
        // Prepare data for ArticleDetailsVC
        
        guard let targetVC = storyboard?.instantiateViewController(withIdentifier: "ArticleDetailsVC") as? ArticleDetailsVC else { return }
        
        let article = articlesData[indexPath.row]
        
        targetVC.articleImageName = article.imageName
        targetVC.articleTitle = article.title
        targetVC.articleAuthor = article.author
        targetVC.articleBody = article.body
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
}
