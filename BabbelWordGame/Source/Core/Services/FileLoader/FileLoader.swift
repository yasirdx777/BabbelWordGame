//
//  FileLoader.swift
//  BabbelWordGame
//
//  Created by Yasir Romaya on 11/19/22.
//

import Foundation

class FileLoader: FileLoaderProtocol {
    func loadJsonFile<T>(withPath path: String, completion: @escaping (Result<T, FileLoaderErrors>) -> ()) where T : Decodable, T : Encodable {
        if let url = Bundle.main.url(forResource: path, withExtension: FileExtensions.Json.rawValue) {
            do {
                let data = try Data(contentsOf: url)
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            } catch let error {
                completion(.failure(FileLoaderErrors.Parsing(error.localizedDescription)))
            }
        }else{
            completion(.failure(FileLoaderErrors.NotFound))
        }
    }
}
