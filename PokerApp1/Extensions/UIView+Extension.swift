//
//  UIView_Extension.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

extension UIView {

    // Add shadow with configurable offset
    func addShadow(width: Double, height: Double){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: width, height: height)
    }
}

