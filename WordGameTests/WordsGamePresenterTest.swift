//
//  WordsGamePresenterTest.swift
//  WordGameTests
//
//  Created by Yasir Romaya on 11/19/22.
//

import XCTest
@testable import WordGame

class MockWordPeerGenerator: WordPeerGeneratorProtocol {
    private let isCorrectTranslation: Bool
    
    
    init(isCorrectTranslation: Bool) {
        self.isCorrectTranslation = isCorrectTranslation
    }
    
    func getRandomWordPeer(wordList: [WordListDataModel]) -> WordPeer? {
        let mockWordPeer = WordPeer(primaryWord: "spanish word 1", primaryWordTranslation: "english word 1", isCorrectTranslation: isCorrectTranslation)
        return mockWordPeer
    }
    
}

final class WordsGamePresenterTest: XCTestCase {
    
    var mockWordPeerGenerator: WordPeerGeneratorProtocol!
    var presenter: WordsGamePresenterProtocol!
    var view: WordsGameView?
    
    override func setUp() {
        mockWordPeerGenerator = MockWordPeerGenerator(isCorrectTranslation: true)
        
        let viewController = WordsGameViewController()
        view = viewController.view as? WordsGameView
        
        let router: WordsGameRouterProtocol = WordsGameRouter()
        
        presenter = WordsGamePresenter(viewController: viewController, router: router, fileLoader: FileLoader(), wordPeerGenerator: mockWordPeerGenerator)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.router = router
    }
    
    
    func testStartNewRound() {
        presenter.startNewRound()
        
        let expectedViewModel = WordsGameViewModel(primaryWord: presenter.wordPeer?.primaryWord, primaryWordTranslation: presenter.wordPeer?.primaryWordTranslation, correctAttempts: "Correct attempts: \(presenter.correctAttempts)", wrongAttempts: "Wrong attempts: \(presenter.wrongAttempts)")
        
        XCTAssertEqual(view?.correctAttemptsLabel.text, expectedViewModel.correctAttempts)
        XCTAssertEqual(view?.wrongAttemptsLabel.text, expectedViewModel.wrongAttempts)
        XCTAssertEqual(view?.primaryWordLabel.text, expectedViewModel.primaryWord)
        XCTAssertEqual(view?.primaryWordTranslationLabel.text, expectedViewModel.primaryWordTranslation)
    }
    
    func testCorrectButtonAction() {
        presenter.startNewRound()
        
        let currentCorrectAttempts = presenter.correctAttempts
        let currentRoundsLimit = presenter.roundsLimit
        
        presenter.correctButtonAction()
        
        XCTAssertEqual(presenter?.correctAttempts, currentCorrectAttempts + 1)
        XCTAssertEqual(presenter?.roundsLimit, currentRoundsLimit - 1)
    }
    
    func testWrongButtonAction() {
        presenter.startNewRound()
        
        let currentWrongAttempts = presenter.wrongAttempts
        let currentRoundsLimit = presenter.roundsLimit
        
        presenter.wrongButtonAction()
        
        XCTAssertEqual(presenter.wrongAttempts, currentWrongAttempts + 1)
        XCTAssertEqual(presenter.roundsLimit, currentRoundsLimit - 1)
    }
    
}
