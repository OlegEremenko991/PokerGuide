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

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Private properties

    private var newsData = [News]()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        showOnboarding()
        loadNews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    // MARK: Private methods

    private func setupView() {
        tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
    }

    private func loadNews() {
        DataLoader.loadData(decodingType: [News].self, resourceName: "News") { result in
            switch result {
            case .success(let news):
                newsData = news.sorted(by: { $0.id < $1.id })
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func showOnboarding() {
        if OnboardingService.shared.isNewUser() {
            let onboardingVC = OnboardViewController(pageItems: OnboardingService.shared.pages, appearanceConfiguration: OnboardingService.shared.appearance)
            onboardingVC.modalPresentationStyle = .fullScreen
            onboardingVC.presentFrom(self, animated: true)
        }
        OnboardingService.shared.setIsNotNewUser() // disable onboarding
    }

}

// MARK: - TableView DataSource and Delegate

extension NewsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { CGFloat(250) }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { newsData.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: NewsCell.cellID) as! NewsCell
        let news = newsData[indexPath.row]
        newsCell.setupCellWith(title: news.title,
                               date: news.date,
                               author: news.author,
                               imageName: news.imageName)
        return newsCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Set cell as selected
        let newsCell = tableView.dequeueReusableCell(withIdentifier: NewsCell.cellID) as! NewsCell
        newsCell.isSelected = true

        // Prepare data for NewsBodyVC
        guard let targetVC = storyboard?.instantiateViewController(withIdentifier: "NewsBodyVC") as? NewsBodyVC else { return }

        let news = newsData[indexPath.row]
        targetVC.setupWithData(data: news)

        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(targetVC, animated: true)
    }

}

