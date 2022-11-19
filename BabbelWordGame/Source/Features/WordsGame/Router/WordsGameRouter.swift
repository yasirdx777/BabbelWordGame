//
//  WordsGameRouter.swift
//  BabbelWordGame
//
//  Created by Yasir Romaya on 11/19/22.
//

import Foundation
import UIKit

class WordsGameRouter: WordsGameRouterProtocol {
    
    weak var viewController: UIViewController?

    func configuredViewController() -> UIViewController {
        let router: WordsGameRouterProtocol = WordsGameRouter()
        let viewController: WordsGameViewControllerProtocol = WordsGameViewController()
        let presenter: WordsGamePresenterProtocol = WordsGamePresenter(viewController: viewController, router: router, fileLoader: FileLoader(), wordPeerGenerator: WordPeerGenerator())
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.router = router
        
        return viewController as! UIViewController
    }

}
