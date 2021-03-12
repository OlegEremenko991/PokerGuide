//
//  UIButton_Extension.swift
//  PokerApp1
//
//  Created by Олег Еременко on 07.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

extension UIButton {

    /// Custom button rounded style with white background
    func roundedWithBackground(){
        layer.cornerRadius = 10
        backgroundColor = .white
    }

    /// Custom button style
    func customRoundedStyle(){
        backgroundColor = .black
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 24
    }

}
