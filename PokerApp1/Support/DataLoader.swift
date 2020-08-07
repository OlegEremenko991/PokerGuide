//
//  DataLoader.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import Foundation

public class DataLoader {
        
    var news = [News]()
    var articles = [Article]()
    var videos = [Video]()
    
    init() {
        loadNews()
        loadArticles()
        loadVideos()
        sort()
    }
    
    func loadNews() {

        if let fileLocation = Bundle.main.url(forResource: "News", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([News].self, from: data)
                self.news = dataFromJson
            } catch {
                print(error)
            }
        }
    }

    func loadArticles() {

        if let fileLocation = Bundle.main.url(forResource: "Articles", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Article].self, from: data)
                self.articles = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func loadVideos() {

        if let fileLocation = Bundle.main.url(forResource: "Videos", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Video].self, from: data)
                self.videos = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func sort() {
        self.news = self.news.sorted(by: { $0.id < $1.id })
        self.articles = self.articles.sorted(by: { $0.id < $1.id })
        self.videos = self.videos.sorted(by: { $0.id < $1.id })
    }
}
