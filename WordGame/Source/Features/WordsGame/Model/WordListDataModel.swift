//
//  WordListDataModel.swift
//  WordGame
//
//  Created by Yasir Romaya on 11/19/22.
//

import Foundation

struct WordListDataModel: Codable {
    let englishWord: String?
    let spanishWord: String?
    
    private enum CodingKeys : String, CodingKey {
        case englishWord = "text_eng"
        case spanishWord = "text_spa"
    }
}
