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
    
    func animatePrimaryWordLabel() {
        guard let customViewRef = customViewRef else { return }
        
        UIView.transition(with: customViewRef.primaryWordLabel,
                          duration: TimeInterval(presenter!.roundTimerLimit),
                          options: .curveLinear,
                          animations: { [weak self] in
            
            guard let self = self else { return }
            
            let superViewHeight = self.customViewRef?.frame.height ?? 200

            self.customViewRef?.primaryWordLabel.frame.origin.y += superViewHeight * 0.15
        }, completion: nil)
    }
    
    func gameSessionEnded(wordsGameViewModel: WordsGameViewModel) {
        let correctAttempts = wordsGameViewModel.correctAttempts ?? ""
        let wrongAttempts = wordsGameViewModel.wrongAttempts ?? ""
        
        customViewRef?.correctAttemptsLabel.text = correctAttempts
        customViewRef?.wrongAttemptsLabel.text = wrongAttempts
        
        let title = "Your Result"
        let message = "\(correctAttempts)\n\(wrongAttempts)"
        
        let resultDialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        resultDialog.addAction(UIAlertAction(title: "Restart", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            
            self.presenter?.restart()
        }))
        
        resultDialog.addAction(UIAlertAction(title: "Quit", style: .default, handler: { _ in
            exit(0)
        }))
        
        present(resultDialog, animated: true)
    }
    
}
