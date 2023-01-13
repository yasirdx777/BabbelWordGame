//
//  WordPeerGenerator.swift
//  WordGame
//
//  Created by Yasir Romaya on 11/19/22.
//

import Foundation

class WordPeerGenerator: WordPeerGeneratorProtocol {
    
    private let correctTranslationProbability: Double
    
    private var randomDouble: Double {
        return Double.random(in: 0.0...1.0)
    }
    
    init(_ correctTranslationProbability: Double = 0.25) {
        self.correctTranslationProbability = correctTranslationProbability
    }
    
    
    func getRandomWordPeer(wordList: [WordListDataModel]) -> WordPeer? {
        if wordList.isEmpty {return nil}
        
        let wordListCount = wordList.count
        
        var wordPeer = WordPeer()
        
        if wordListCount == 1 {
            wordPeer.primaryWord = wordList.first?.spanishWord
            wordPeer.primaryWordTranslation = wordList.first?.englishWord
            wordPeer.isCorrectTranslation = true
            return wordPeer
        }
        
        let initialIndex = getRandomIndexFromArray(arrayCount: wordListCount)
        
        let initialWord = wordList[initialIndex]
        
        wordPeer.primaryWord = initialWord.spanishWord
        
        let isCorrectTranslation = randomDouble <= correctTranslationProbability
        
        if (isCorrectTranslation) {
            wordPeer.primaryWordTranslation = initialWord.englishWord
            wordPeer.isCorrectTranslation = true
            return wordPeer
        }
        
        var secondaryIndex = getRandomIndexFromArray(arrayCount: wordListCount)
        
        if secondaryIndex == initialIndex {
            secondaryIndex = (secondaryIndex + 1) % wordListCount
        }
        
        let secondaryWord = wordList[secondaryIndex]
        
        wordPeer.primaryWordTranslation = secondaryWord.englishWord
        wordPeer.isCorrectTranslation = false
        
        return wordPeer
    }
    
}

extension WordPeerGenerator {
    private func getRandomIndexFromArray(arrayCount: Int) -> Int {
        let count = Double(arrayCount)
        
        var index = randomDouble * count
        index.round(.down)
        
        return Int(index)
    }
}
