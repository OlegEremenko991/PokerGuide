//
//  ViewController.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit
import OnboardKit

final class NewsVC: UIViewController {
    
// MARK: IBOutlets

    @IBOutlet private weak var tableView: UITableView!
    
// MARK: Private properties

    private let newsCellID = "NewsCellID"
    private let newsData = DataLoader().news
    private var onboardingPages: [OnboardPage] {
        let pageOne = OnboardPage(title: "Check out poker news", imageName: "page1", description: "Everything you need to know about WSOP is here!")
        let pageTwo = OnboardPage(title: "Study poker rules", imageName: "page2", description: "Read poker guides to become familiar with the game and play better!")
        let pageThree = OnboardPage(title: "Watch poker videos", imageName: "page3", description: "Raise your poker skill with video guides!")
        let pageFour = OnboardPage(title: "Get support", imageName: "page4", description: "If you need support feel free to open 'Support' tab and ask your question!", advanceButtonTitle: "Get started!")
        return [pageOne, pageTwo, pageThree, pageFour]
    }
    
    private let onboardingAppearance = OnboardViewController.AppearanceConfiguration(tintColor: .black, titleColor: .black, textColor: .black, backgroundColor: .white, imageContentMode: .scaleAspectFit)
    
// MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        showOnboarding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true) // Show navigation bar
    }
    
// MARK: Private methods
    
    private func setupView() {
        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
    }
    
    private func showOnboarding() {
        if OnboardingUDcheck.shared.isNewUser() {
            let onboardingVC = OnboardViewController(pageItems: onboardingPages, appearanceConfiguration: onboardingAppearance)
            onboardingVC.modalPresentationStyle = .fullScreen
            onboardingVC.presentFrom(self, animated: true)
        }
        OnboardingUDcheck.shared.setIsNotNewUser() // disable onboarding
    }

}

// MARK: TableView DataSource and Delegate

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
        newsCell.setupCellWith(title: news.title,
                               date: news.date,
                               author: news.author,
                               image: (UIImage(named: news.imageName)!))
        return newsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Set cell as selected

        let newsCell = tableView.dequeueReusableCell(withIdentifier: newsCellID) as! NewsCell
        newsCell.isSelected = true
        
        // Prepare data for NewsBodyVC
        
        guard let targetVC = storyboard?.instantiateViewController(withIdentifier: "NewsBodyVC") as? NewsBodyVC else { return }
        
        let news = newsData[indexPath.row]
        
        targetVC.newsImageName = news.imageName
        targetVC.newsTitle = news.title
        targetVC.newsBody = news.body
        targetVC.newsAuthor = news.author
        targetVC.newsDate = news.date
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
}

