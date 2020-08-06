//
//  News.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import Foundation

struct News: Codable {
    var id: Int
    var title: String
    var date: String
    var author: String
    var body: String
}
