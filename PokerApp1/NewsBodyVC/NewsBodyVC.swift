//
//  NewsBodyVC.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

final class NewsBodyVC: UIViewController {
    
// MARK: IBOutlets

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsBodyLabel: UILabel!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    
// MARK: Public properties

    var newsImageName = ""
    var newsTitle = ""
    var newsAuthor = ""
    var newsDate = ""
    var newsBody = ""
    
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
        
        newsImageView.backgroundColor = .black
        newsImageView.image = UIImage(named: newsImageName)
        
        
        newsBodyLabel.text = newsBody
        newsTitleLabel.text = newsTitle
        newsDateLabel.text = newsDate
        newsAuthorLabel.text = newsAuthor
        
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

extension NewsBodyVC: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
