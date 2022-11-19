//
//  WordsGameViewControllerProtocol.swift
//  BabbelWordGame
//
//  Created by Yasir Romaya on 11/19/22.
//

import Foundation

protocol WordsGameViewControllerProtocol: AnyObject {
    var presenter: WordsGamePresenterProtocol? { get set }
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showError(error: Error)
    func updateView(wordsGameViewModel: WordsGameViewModel)
    func animatePrimaryWordLabel()
    func gameSessionEnded(wordsGameViewModel: WordsGameViewModel)
}
