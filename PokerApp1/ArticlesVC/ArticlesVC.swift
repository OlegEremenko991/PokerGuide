//
//  ArticlesVC.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

class ArticlesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let articleCellID = "ArticleCellID"
    let articlesData = DataLoader().articles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: Show nav bar
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

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
       
        // MARK: Set cell as selected

        let articleCell = tableView.dequeueReusableCell(withIdentifier: articleCellID) as! ArticleCell
        articleCell.isSelected = true
        
        // MARK: Prepare data for ArticleDetailsVC
        guard let targetVC = storyboard?.instantiateViewController(withIdentifier: "ArticleDetailsVC") as? ArticleDetailsVC else { return }
        
        let article = articlesData[indexPath.row]
        
        targetVC.articleImageName = article.imageName
        targetVC.articleTitle = article.title
        targetVC.articleBody = article.body
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
}
