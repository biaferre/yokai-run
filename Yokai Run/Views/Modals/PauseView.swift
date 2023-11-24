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
        
        setupViewHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViewModel(gameViewModel: GameViewModel) {
        self.gameViewModel = gameViewModel
    }
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImage(named: "PauseView-Bg")
        var imageView = UIImageView(image: image)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        
        return imageView
      }()
    
    @objc func resumeAction() {
        if ((gameViewModel?.gameInfo.isDead) == false) {
            gameViewModel?.didPause()
        }
    }
    
    @objc func restartAction() {
        gameViewModel?.restart()
    }
    
    @objc func menuAction() {
        NavigationManager.shared.popViewController(animated: true)
    }
    
    // --MARK: buttons

    func setupViewHierarchy() {
        buttonStack.addArrangedSubview(resumeButton)
        buttonStack.addArrangedSubview(restartButton)
        buttonStack.addArrangedSubview(menuButton)
        
        self.addSubview(backgroundImage)
        self.addSubview(buttonStack)
    }
    
    func setupLayout() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonStack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    var buttonStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
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
    
    var menuButton: UIButton = {
         var button = MainButtonComponent(type: .secondary, title: "Back To Menu").button
         button.addTarget(self, action: #selector(menuAction), for: .touchUpInside)
         return button

     }()
}
