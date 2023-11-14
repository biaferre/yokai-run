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
        gameViewModel?.didPause()
    }
    
    @objc func restartAction() {
        print("restart")
        //gameViewModel?.didPause()
    }
    
//    init(gameScene: GameScene) {
//        super.init(frame: .zero)
//
//        self.gameScene = gameScene
//    }
//
//    // --MARK: setup
//    func setupContent() {
//        self.addSubview(titleStack)
//        self.addSubview(buttonStack)
//    }
//
//    func setupLayout() {
//        self.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            self.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            self.centerYAnchor.constraint(equalTo: self.centerYAnchor)
//        ])
//    }
//
//    // --MARK: title and image
//
//    lazy var title: UILabel = {
//        let label = UILabel()
//        label.text = "Pause"
//        label.font = UIFont(name: "Neo-Tech", size: 24)
//        return label
//    }()
//
//    lazy var image = UIImage(named: "Lotus")
//
//    lazy var titleStack: UIStackView = {
//        var stack = UIStackView(arrangedSubviews: [title, UIImageView(image: image)])
//        stack.axis = .vertical
//        return stack
//    }()
//
//
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
}
