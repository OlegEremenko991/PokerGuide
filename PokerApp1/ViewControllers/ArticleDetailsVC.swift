//
//  ArticleDetailsVC.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

final class ArticleDetailsVC: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var articleImageView: UIImageView! {
        didSet {
            articleImageView.image = UIImage(named: articleImageName)
            articleImageView.backgroundColor = .black
        }
    }

    @IBOutlet private weak var articleTitleLabel: UILabel! {
        didSet { articleTitleLabel.text = articleTitle }
    }

    @IBOutlet private weak var articleAuthorLabel: UILabel! {
        didSet { articleAuthorLabel.text = articleAuthor }
    }

    @IBOutlet private weak var articleBodyLabel: UILabel! {
        didSet { articleBodyLabel.text = articleBody }
    }

    @IBOutlet private weak var backButton: UIButton! {
        didSet { backButton.roundedWithBackground() }
    }

    @IBOutlet private weak var infoView: UIView! {
        didSet {
            infoView.layer.cornerRadius = 25
            infoView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            infoView.clipsToBounds = true
        }
    }
    
    // MARK: - Private properties

    private var articleImageName = ""
    private var articleTitle = ""
    private var articleAuthor = ""
    private var articleBody = ""
    
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

    func setupWithData(data: Article) {
        articleImageName = data.imageName
        articleTitle = data.title
        articleAuthor = data.author
        articleBody = data.body
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

extension ArticleDetailsVC: UIGestureRecognizerDelegate {
    // Enable swipe to go back
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
