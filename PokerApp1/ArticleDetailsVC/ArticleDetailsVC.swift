//
//  ArticleDetailsVC.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

class ArticleDetailsVC: UIViewController {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleAuthorLabel: UILabel!
    @IBOutlet weak var articleBodyLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var infoView: UIView!
    
    var articleImageName = ""
    var articleTitle = ""
    var articleAuthor = ""
    var articleBody = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    // MARK: Back button
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupView(){
        articleImageView.image = UIImage(named: articleImageName)
        articleImageView.backgroundColor = .black
        articleTitleLabel.text = articleTitle
        articleBodyLabel.text = articleBody
        articleAuthorLabel.text = articleAuthor
        backButton.roundedWithBackground()
        infoView.layer.cornerRadius = 25
        infoView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        infoView.clipsToBounds = true
    }
    
    // MARK: Hide nav bar
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

}

// MARK: Enable swipe to go back

extension ArticleDetailsVC: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
