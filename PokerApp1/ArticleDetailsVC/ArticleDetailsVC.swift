//
//  ArticleDetailsVC.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

final class ArticleDetailsVC: UIViewController {

// MARK: IBOutlets

    @IBOutlet private weak var articleImageView: UIImageView!
    @IBOutlet private weak var articleTitleLabel: UILabel!
    @IBOutlet private weak var articleAuthorLabel: UILabel!
    @IBOutlet private weak var articleBodyLabel: UILabel!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var infoView: UIView!
    
// MARK: Public properties

    var articleImageName = ""
    var articleTitle = ""
    var articleAuthor = ""
    var articleBody = ""
    
// MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true) // Hide navigation bar
    }
    
// MARK: Private methods
    
    private func setupView(){
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        articleImageView.image = UIImage(named: articleImageName)
        articleImageView.backgroundColor = .black
        
        articleTitleLabel.text = articleTitle
        articleBodyLabel.text = articleBody
        articleAuthorLabel.text = articleAuthor
        
        infoView.layer.cornerRadius = 25
        infoView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        infoView.clipsToBounds = true
        
        backButton.roundedWithBackground()
    }
    
// MARK: IBActions

    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }

}

// MARK: UIGestureRecognizerDelegate - enable swipe to go back

extension ArticleDetailsVC: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
