//
//  VideoCell.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    @IBOutlet weak var backView2: UIView!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var previewTitleLabel: UILabel!
    
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

    // MARK: Setup view
    
    private func setupView(){
        contentView.layer.cornerRadius = 10
        previewImageView.layer.cornerRadius = 10
        backView2.layer.cornerRadius = 10
        backView2.addShadow(width: 1.0, height: 2.0)
        previewTitleLabel.setCustomBackground()
    }
}
