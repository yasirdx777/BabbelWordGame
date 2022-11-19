//
//  FileLoaderProtocol.swift
//  BabbelWordGame
//
//  Created by Yasir Romaya on 11/19/22.
//

import Foundation

protocol FileLoaderProtocol {
    func loadJsonFile<T: Codable>(withPath path: String, completion: @escaping (Result<T , FileLoaderErrors>) -> ())
}
