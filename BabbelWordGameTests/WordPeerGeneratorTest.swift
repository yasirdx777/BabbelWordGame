//
//  WordPeerGeneratorTest.swift
//  BabbelWordGameTests
//
//  Created by Yasir Romaya on 11/19/22.
//

import XCTest
@testable import BabbelWordGame

final class WordPeerGeneratorTests: XCTestCase {
    
    
    func testHandlingEmptyWordList() {
        let wordPeerGenerator: WordPeerGeneratorProtocol = WordPeerGenerator()
        
        let generatedWordPeer = wordPeerGenerator.getRandomWordPeer(wordList: [])
        
        XCTAssertNil(generatedWordPeer)
    }
    
    func testGenerateCorrectWordPeerFromWordListWithOneItem() {
        let wordPeerGenerator: WordPeerGeneratorProtocol = WordPeerGenerator()
        
        let mockWordListItem = WordListDataModel(englishWord: "english word 1", spanishWord: "spanish word 1")
        
        let generatedWordPeer = wordPeerGenerator.getRandomWordPeer(wordList: [mockWordListItem])
        
        let expectedWordPeer = WordPeer(primaryWord: "spanish word 1", primaryWordTranslation: "english word 1", isCorrectTranslation: true)
        
        XCTAssertEqual(generatedWordPeer, expectedWordPeer)
    }
    
    
    
    func testWordPeerPrimaryWordStringShouldNotEqualPrimaryWordTranslationtonString() {
        let wordPeerGenerator: WordPeerGeneratorProtocol = WordPeerGenerator()
        
        let itemsCount = 10
        
        let mockWordList = wordListSuit(itemsCount: itemsCount)
        
        for _ in 0...itemsCount-1 {
            let generatedWordPeer = wordPeerGenerator.getRandomWordPeer(wordList: mockWordList)
            
            XCTAssertNotEqual(generatedWordPeer?.primaryWord, generatedWordPeer?.primaryWordTranslation)
        }
        
    }
    
    
    
    func testWorrdPeerCorrectTranslationIndicator() {
        let wordPeerGenerator: WordPeerGeneratorProtocol = WordPeerGenerator()
        
        let itemsCount = 10
        
        let mockWordList = wordListSuit(itemsCount: itemsCount)
        
        for _ in 0...itemsCount-1 {
            let generatedWordPeer = wordPeerGenerator.getRandomWordPeer(wordList: mockWordList)
            
            let primaryWordIndexStr = generatedWordPeer?.primaryWord?.split(separator: " ").last
            let primaryWordTranslationIndexStr = generatedWordPeer?.primaryWordTranslation?.split(separator: " ").last
            
            let primaryWordIndex = Int(primaryWordIndexStr!)
            let primaryWordTranslationIndex = Int(primaryWordTranslationIndexStr!)
            
            if (generatedWordPeer!.isCorrectTranslation!) {
                XCTAssertEqual(primaryWordIndex, primaryWordTranslationIndex)
            }else{
                XCTAssertNotEqual(primaryWordIndex, primaryWordTranslationIndex)
            }
            
        }
        
    }
    
    
    func testGenerateAllCorrectWordPeerFromWordListWithTenItems() {
        let wordPeerGenerator: WordPeerGeneratorProtocol = WordPeerGenerator(1)
        
        let itemsCount = 10
        
        let mockWordList = wordListSuit(itemsCount: itemsCount)
        
        for _ in 0...itemsCount-1 {
            let generatedWordPeer = wordPeerGenerator.getRandomWordPeer(wordList: mockWordList)
            
            if let isCorrectTranslation = generatedWordPeer?.isCorrectTranslation {
                XCTAssertTrue(isCorrectTranslation)
            }
            
        }

    }
    
    func wordListSuit(itemsCount: Int) -> [WordListDataModel] {
        
        var mockWordList = [WordListDataModel]()
        
        for i in 0...itemsCount-1 {
            let mockWordListItem = WordListDataModel(englishWord: "english word \(i)", spanishWord: "spanish word \(i)")
            mockWordList.append(mockWordListItem)
        }
        
        return mockWordList
    }
    
}
