//
//  PauseScene.swift
//  Yokai Run
//
//  Created by Bof on 10/11/23.
//

import Foundation
import SpriteKit

class PauseView: UIView {
    var gameViewModel: GameViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buttonStack.addArrangedSubview(resumeButton)
        buttonStack.addArrangedSubview(restartButton)

        self.addSubview(buttonStack)
        
        setupButtons()
        
        self.backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViewModel(gameViewModel: GameViewModel) {
        self.gameViewModel = gameViewModel
    }
    
    @objc func resumeAction() {
        if ((gameViewModel?.gameInfo.isDead) == false) {
            gameViewModel?.didPause()
        }
    }
    
    @objc func restartAction() {
        print("restart")
        //gameViewModel?.didPause()
    }
    
    @objc func menuAction() {
        
    }
    
    // --MARK: buttons

    func setupButtons() {
        
                buttonStack.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    buttonStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                    buttonStack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
                ])
    }
    
    var buttonStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()

    var resumeButton: UIButton = {
        var button = MainButtonComponent(type: .primary, title: "Resume").button
        button.addTarget(self, action: #selector(resumeAction), for: .touchUpInside)
        return button

    }()

   var restartButton: UIButton = {
        var button = MainButtonComponent(type: .secondary, title: "Restart").button
        button.addTarget(self, action: #selector(restartAction), for: .touchUpInside)
        return button

    }()
    
    var homeButton: UIButton = {
         var button = MainButtonComponent(type: .secondary, title: "Back To Menu").button
         button.addTarget(self, action: #selector(menuAction), for: .touchUpInside)
         return button

     }()
}
