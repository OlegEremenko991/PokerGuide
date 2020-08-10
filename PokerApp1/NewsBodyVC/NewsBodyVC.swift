//
//  NewsBodyVC.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

class NewsBodyVC: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsBodyLabel: UILabel!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    
    var newsImageName = ""
    var newsTitle = ""
    var newsAuthor = ""
    var newsDate = ""
    var newsBody = ""
    
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
        newsBodyLabel.text = newsBody
        newsImageView.image = UIImage(named: newsImageName)
        newsImageView.backgroundColor = .black
        newsTitleLabel.text = newsTitle
        newsDateLabel.text = newsDate
        newsAuthorLabel.text = newsAuthor
        infoView.layer.cornerRadius = 25
        infoView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        infoView.clipsToBounds = true
        backButton.roundedWithBackground()
    }
    
    // MARK: Hide nav bar
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

}

extension NewsBodyVC: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
