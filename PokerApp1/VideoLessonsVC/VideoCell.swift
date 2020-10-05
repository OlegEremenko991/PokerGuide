//
//  VideoCell.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

final class VideoCell: UITableViewCell {

// MARK: IBOutlets
    
    @IBOutlet weak var backView2: UIView!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var previewTitleLabel: UILabel!
    
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

// MARK: Private methods

    private func setupView(){
        contentView.layer.cornerRadius = 10
        previewImageView.layer.cornerRadius = 10
        backView2.layer.cornerRadius = 10
        backView2.addShadow(width: 1.0, height: 2.0)
        previewTitleLabel.setCustomBackground()
    }
}
