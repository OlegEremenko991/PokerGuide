//
//  ViewController.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

class NewsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let newsCellID = "NewsCellID"
    
    let newsData = DataLoader().news
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
    }

    // MARK: Show nav bar
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

extension NewsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(250)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: newsCellID) as! NewsCell
        let news = newsData[indexPath.row]
        
        newsCell.newsImageView.image = UIImage(named: news.imageName)
        newsCell.newsTitle.text = news.title
        newsCell.newsDate.text = news.date
        newsCell.newsAuthor.text = news.author
        
        return newsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // MARK: Set cell as selected

        let newsCell = tableView.dequeueReusableCell(withIdentifier: newsCellID) as! NewsCell
        newsCell.isSelected = true
        
        // MARK: Prepare data for NewsBodyVC
        guard let targetVC = storyboard?.instantiateViewController(withIdentifier: "NewsBodyVC") as? NewsBodyVC else { return }
        
        let news = newsData[indexPath.row]
        
        targetVC.newsImageName = news.imageName
        targetVC.newsTitle = news.title
        targetVC.newsBody = news.body
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
}

