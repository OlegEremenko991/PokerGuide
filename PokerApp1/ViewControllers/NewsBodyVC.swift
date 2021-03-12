//
//  NewsBodyVC.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

final class NewsBodyVC: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet private weak var backButton: UIButton! {
        didSet { backButton.roundedWithBackground() }
    }

    @IBOutlet private weak var newsTitleLabel: UILabel! {
        didSet { newsTitleLabel.text = newsTitle }
    }

    @IBOutlet private weak var newsImageView: UIImageView! {
        didSet {
            newsImageView.backgroundColor = .black
            newsImageView.image = UIImage(named: newsImageName)
        }
    }

    @IBOutlet private weak var newsBodyLabel: UILabel! {
        didSet { newsBodyLabel.text = newsBody }
    }

    @IBOutlet private weak var infoView: UIView! {
        didSet {
            infoView.layer.cornerRadius = 25
            infoView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            infoView.clipsToBounds = true
        }
    }

    @IBOutlet private weak var newsDateLabel: UILabel! {
        didSet { newsDateLabel.text = newsDate }
    }

    @IBOutlet private weak var newsAuthorLabel: UILabel! {
        didSet { newsAuthorLabel.text = newsAuthor }
    }
    
    // MARK: - Private properties

    private var newsImageName = ""
    private var newsTitle = ""
    private var newsAuthor = ""
    private var newsDate = ""
    private var newsBody = ""
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK: - Public methods

    func setupWithData(data: News) {
        newsImageName = data.imageName
        newsTitle = data.title
        newsAuthor = data.author
        newsDate = data.date
        newsBody = data.body
    }
    
    // MARK: - Private methods

    private func setupView(){
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    // MARK: - IBActions
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }

}

// MARK: - UIGestureRecognizerDelegate

extension NewsBodyVC: UIGestureRecognizerDelegate {
    // Enable swipe to go back
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
