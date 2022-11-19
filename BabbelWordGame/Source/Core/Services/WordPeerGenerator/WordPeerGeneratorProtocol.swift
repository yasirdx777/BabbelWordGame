//
//  WordPeerGeneratorProtocol.swift
//  BabbelWordGame
//
//  Created by Yasir Romaya on 11/19/22.
//

import Foundation

protocol WordPeerGeneratorProtocol {
    func getRandomWordPeer(wordList: [WordListDataModel]) -> WordPeer?
}
