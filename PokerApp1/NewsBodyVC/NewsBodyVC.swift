//
//  NewsBodyVC.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

class NewsBodyVC: UIViewController {
    @IBOutlet weak var newsBodyLabel: UILabel!
    
    var newsBody = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView(){
        newsBodyLabel.text = newsBody
    }

}
