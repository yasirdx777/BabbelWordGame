//
//  FileLoaderErrors.swift
//  WordGame
//
//  Created by Yasir Romaya on 11/19/22.
//

import Foundation

enum FileLoaderErrors: Error {
    case NotFound
    case Parsing(String)
    case Unknown
}
