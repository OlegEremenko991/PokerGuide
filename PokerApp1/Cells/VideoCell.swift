//
//  VideoCell.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

final class VideoCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var previewImageView: UIImageView! {
        didSet { previewImageView.layer.cornerRadius = 10 }
    }

    @IBOutlet private weak var previewTitleLabel: UILabel! {
        didSet { previewTitleLabel.setCustomBackground() }
    }

    @IBOutlet private weak var backView2: UIView! {
        didSet {
            backView2.layer.cornerRadius = 10
            backView2.addShadow(width: 1.0, height: 2.0)
        }
    }

    // MARK: - Public properties

    static let cellID = "VideoCellID"

    // MARK: - Lifecycle

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

    // MARK: - Public methods
        
    func setupCellWith(title: String, imageName: String) {
        previewTitleLabel.text = title
        previewImageView.image = UIImage(named: imageName)
    }

    // MARK: - Private methods

    private func setupView(){
        contentView.layer.cornerRadius = 10
    }

}
