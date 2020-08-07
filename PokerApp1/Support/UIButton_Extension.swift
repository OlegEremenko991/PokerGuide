//
//  UIButton_Extension.swift
//  PokerApp1
//
//  Created by Олег Еременко on 07.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

extension UIButton {
    
    // Custom button rounded style with white background
    
    func roundedWithBackground(){
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor(white: 1, alpha: 0.4)
    }
    
    // Custom button style
    
    func customRoundedStyle(){
        self.backgroundColor = .lightGray
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 10
        self.setTitleColor(.gray, for: .disabled)
    }

}
