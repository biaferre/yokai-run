//
//  PauseScene.swift
//  Yokai Run
//
//  Created by Bof on 10/11/23.
//

import Foundation
import SpriteKit

class PauseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
//    // --MARK: buttons
//
//    lazy var buttonStack: UIStackView = {
//        var stack = UIStackView(arrangedSubviews: [resumeButton, quitButton])
//        stack.axis = .vertical
//        return stack
//    }()
//
//    lazy var resumeButton: UIButton = {
//        var button = MainButtonComponent(type: .primary, title: "Resume").button
//        button.addTarget(self, action: #selector(resumeGame), for: .touchUpInside)
//        return button
//
//    }()
//
//    lazy var quitButton: UIButton = {
//        var button = MainButtonComponent(type: .secondary, title: "Restart").button
//        button.addTarget(self, action: #selector(resumeGame), for: .touchUpInside)
//        return button
//
//    }()
//
//    @objc func resumeGame() {
//        gameScene.view?.isPaused.toggle()
//    }
    
}
