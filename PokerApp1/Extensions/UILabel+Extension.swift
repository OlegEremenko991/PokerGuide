//
//  UILabel_Extension.swift
//  PokerApp1
//
//  Created by Олег Еременко on 07.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

extension UILabel {

    // Custom background for labels
    func setCustomBackground(){
        self.backgroundColor = UIColor(white: 1, alpha: 0.8)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
    }
}
