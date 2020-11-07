//
//  NewsCell.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

final class NewsCell: UITableViewCell {
    
// MARK: IBOutlets

    @IBOutlet private weak var newsTitle: UILabel!
    @IBOutlet private weak var newsDate: UILabel!
    @IBOutlet private weak var newsAuthor: UILabel!
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var backView2: UIView!
    
// MARK: Public properties
    
    static let cellID = "NewsCellID"
    
// MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectedBackgroundView = UIView()
        selectedBackgroundView?.layer.cornerRadius = 10
        selectedBackgroundView?.backgroundColor = .lightGray
    }
    
// MARK: Public methods
    
    func setupCellWith(title: String, date: String, author: String, imageName: String) {
        newsTitle.text = title
        newsDate.text = date
        newsAuthor.text = author
        newsImageView.image = UIImage(named: imageName)
    }
    
// MARK: Private methods
    
    private func setupView() {
        contentView.layer.cornerRadius = 10
        
        newsImageView.layer.cornerRadius = 10
        backView2.layer.cornerRadius = 10
        backView2.addShadow(width: 1.0, height: 2.0)
        backView2.backgroundColor = .black
        
        setupLabels()
    }
    
    private func setupLabels() {
        let labels = [newsTitle, newsDate, newsAuthor]
        for x in labels {
            x?.textColor = .white
        }
    }

}
