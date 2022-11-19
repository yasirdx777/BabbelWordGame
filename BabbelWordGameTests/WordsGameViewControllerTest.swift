//
//  WordsGameViewControllerTest.swift
//  BabbelWordGameTests
//
//  Created by Yasir Romaya on 11/19/22.
//

import XCTest
@testable import BabbelWordGame

final class WordsGameViewControllerTest: XCTestCase {
    
    func testuUpdateLabelsText() {
        let viewController = WordsGameViewController()
        let view = viewController.view as? WordsGameView
        
        let mockViewModel = WordsGameViewModel(primaryWord: "Spanish word 1", primaryWordTranslation: "English word 1", correctAttempts: "Correct attempts: 0", wrongAttempts: "Wrong attempts: 0")
        
        viewController.updateView(wordsGameViewModel: mockViewModel)
        
        
        XCTAssertEqual(view?.correctAttemptsLabel.text, mockViewModel.correctAttempts)
        XCTAssertEqual(view?.wrongAttemptsLabel.text, mockViewModel.wrongAttempts)
        XCTAssertEqual(view?.primaryWordLabel.text, mockViewModel.primaryWord)
        XCTAssertEqual(view?.primaryWordTranslationLabel.text, mockViewModel.primaryWordTranslation)
    }


}
