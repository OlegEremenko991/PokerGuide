//
//  DataLoader.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import Foundation

final class DataLoader {

    typealias ResultCompletion<T> = (Result<T, Error>) -> ()

    static func loadData<T: Decodable>(decodingType: T.Type, resourceName: String, completion: ResultCompletion<T>) {
        if let fileLocation = Bundle.main.url(forResource: resourceName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode(decodingType.self, from: data)
                completion(.success(dataFromJson))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
    }

}
