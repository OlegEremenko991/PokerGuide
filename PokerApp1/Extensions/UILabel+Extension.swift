//
//  UILabel_Extension.swift
//  PokerApp1
//
//  Created by Олег Еременко on 07.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

extension UILabel {

    /// Custom background for labels
    func setCustomBackground(){
        backgroundColor = UIColor(white: 1, alpha: 0.8)
        layer.masksToBounds = true
        layer.cornerRadius = 5
    }
}
