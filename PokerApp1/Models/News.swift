//
//  News.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import Foundation

struct News: Codable {
    let id: Int
    let title: String
    let imageName: String
    let date: String
    let author: String
    let body: String
}
