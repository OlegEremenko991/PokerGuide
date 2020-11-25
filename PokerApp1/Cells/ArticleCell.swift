//
//  ArticleCell.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

final class ArticleCell: UITableViewCell {

// MARK: IBOutlets

    @IBOutlet private weak var articleTitleLabel: UILabel!
    @IBOutlet private weak var articleAuthorLabel: UILabel!
    @IBOutlet private weak var backView2: UIView!
    @IBOutlet private weak var articleImageView: UIImageView!

// MARK: Public properties

    static let cellID = "ArticleCellID"

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

    func setupCellWith(title: String, author: String, imageName: String) {
        articleTitleLabel.text = title
        articleAuthorLabel.text = author
        articleImageView.image = UIImage(named: imageName)
    }

// MARK: Private methods

    private func setupView(){
        contentView.layer.cornerRadius = 10

        articleImageView.layer.cornerRadius = 10

        backView2.layer.cornerRadius = 10
        backView2.addShadow(width: 1.0, height: 2.0)
    }

}
