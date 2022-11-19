//
//  WordsGameViewController.swift
//  BabbelWordGame
//
//  Created by Yasir Romaya on 11/18/22.
//

import UIKit

class WordsGameViewController: UIViewController, WordsGameViewControllerProtocol {
    var presenter: WordsGamePresenterProtocol?
    
    private var customViewRef:WordsGameView?
    
    override func loadView() {
        view = WordsGameView()
        customViewRef = view as? WordsGameView
        customViewRef?.correctWordButton.addTarget(self, action:#selector(correctWordButtonAction(_:)), for: .touchUpInside)
        customViewRef?.wrongWordButton.addTarget(self, action:#selector(wrongWordButtonAction(_:)), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
    }
    
    @objc func correctWordButtonAction(_ sender: UIButton){
        presenter?.correctButtonAction()
    }
    
    @objc func wrongWordButtonAction(_ sender: UIButton){
        presenter?.wrongButtonAction()
    }
    
    func showLoadingIndicator() {
        print("loading..")
    }
    
    func hideLoadingIndicator() {
        print("loading done")
    }
    
    func showError(error: Error) {
        print(error)
    }
    
    func updateView(wordsGameViewModel: WordsGameViewModel) {
        
        customViewRef?.correctAttemptsLabel.text = wordsGameViewModel.correctAttempts
        customViewRef?.wrongAttemptsLabel.text = wordsGameViewModel.wrongAttempts
        
        customViewRef?.primaryWordLabel.text = wordsGameViewModel.primaryWord
        customViewRef?.primaryWordTranslationLabel.text = wordsGameViewModel.primaryWordTranslation
        
    }
    
}
