//
//  WordsGameView.swift
//  WordGame
//
//  Created by Yasir Romaya on 11/19/22.
//

import Foundation
import UIKit

class WordsGameView: UIView {
    lazy var attemptsLabelStackView : UIStackView = {
        @UsesAutoLayout
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        return stackView
    }()
    
    lazy var correctAttemptsLabel: UILabel = {
        @UsesAutoLayout
        var label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    lazy var wrongAttemptsLabel: UILabel = {
        @UsesAutoLayout
        var label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    lazy var primaryWordLabel: UILabel = {
        @UsesAutoLayout
        var label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    lazy var primaryWordTranslationLabel: UILabel = {
        @UsesAutoLayout
        var label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let actionButtonsStackView : UIStackView = {
        @UsesAutoLayout
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        return stackView
    }()
    
    
    lazy var correctWordButton : UIButton = {
        @UsesAutoLayout
        var button = UIButton()
        if #available(iOS 15.0, *) {
            button.configuration = .filled()
            button.configuration?.baseBackgroundColor = .systemBlue
        } else {
            button.setTitleColor(.blue, for: .normal)
            button.setTitleColor(.clear, for: .highlighted)
        }
        button.setTitle("Correct", for: .normal)
        return button
    }()
    
    lazy var wrongWordButton : UIButton = {
        @UsesAutoLayout
        var button = UIButton()
        if #available(iOS 15.0, *) {
            button.configuration = .filled()
            button.configuration?.baseBackgroundColor = .systemRed
        } else {
            button.setTitleColor(.red, for: .normal)
            button.setTitleColor(.clear, for: .highlighted)
        }
        button.setTitle("Wrong", for: .normal)
        return button
    }()
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        configView()
        connectLayoutConstraint()
    }
    
    private func configView(){
        
        if #available(iOS 13.0, *) {
            backgroundColor = .systemBackground
        } else {
            backgroundColor = .white
        }
        
        addSubview(attemptsLabelStackView)
        addSubview(primaryWordLabel)
        addSubview(primaryWordTranslationLabel)
        addSubview(actionButtonsStackView)
        
        attemptsLabelStackView.addArrangedSubview(correctAttemptsLabel)
        attemptsLabelStackView.addArrangedSubview(wrongAttemptsLabel)
        actionButtonsStackView.addArrangedSubview(correctWordButton)
        actionButtonsStackView.addArrangedSubview(wrongWordButton)
    
    }
    
    func connectLayoutConstraint() {
        addConstraints(
            [
                NSLayoutConstraint(item: primaryWordLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: primaryWordLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 0.88, constant: 0),
            ]
        )
        
        addConstraints(
            [
                NSLayoutConstraint(item: primaryWordTranslationLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: primaryWordTranslationLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0),
            ]
        )
        
        NSLayoutConstraint.activate(
            [attemptsLabelStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -24),
             attemptsLabelStackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 24)
            ]
        )
        
        NSLayoutConstraint.activate(
            [actionButtonsStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 24),
             actionButtonsStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -24),
             actionButtonsStackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -24),
             actionButtonsStackView.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
}
