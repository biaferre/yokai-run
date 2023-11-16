//
//  GameViewController.swift
//  Yokai Run
//
//  Created by Bof on 08/11/23.
//

import Foundation
import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var viewModel = GameViewModel()
    var gameScene: GameScene?
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        viewModel.gameInfo.cycleDelegate = self
            
        // MARK: scene configurations
        
        let skView = SKView(frame: view.frame)
        
        let scene = GameScene(size: skView.bounds.size, gameInfo: viewModel.gameInfo)
        scene.scaleMode = .aspectFill
        
        gameScene = scene
                
        view.addSubview(skView)
        view.addSubview(pauseButton)
        
        pauseView.addViewModel(gameViewModel: viewModel)
        
        pauseView.isHidden = true
        gameOverView.isHidden = true

        print(pauseView.anchorPoint)

        skView.addSubview(pauseView)
        skView.addSubview(gameOverView)

        skView.presentScene(scene)
        
        setupLayout()

    }
    
    lazy var pauseButton: UIButton  = {
        let pauseButton = MinimalButtonComponent(text: "Pause", img: "Lotus").button
        pauseButton.addTarget(self, action: #selector(pausedButton), for: .touchDown)
        return pauseButton
    }()
    
    var gameOverView: UIView = {
        var gameOverView = GameOverView()
        gameOverView.layer.zPosition = 10
        return gameOverView
    }()
    
    var pauseView: PauseView = {
        var pauseView = PauseView()
        pauseView.layer.zPosition = 10
        return pauseView
    }()
    
    
    func setupLayout() {
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pauseButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -44),
            pauseButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 44)
        ])
        
        pauseView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pauseView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pauseView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            pauseView.widthAnchor.constraint(equalToConstant: 200),
            pauseView.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        gameOverView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameOverView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gameOverView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            gameOverView.widthAnchor.constraint(equalToConstant: 200),
            gameOverView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    @objc func pausedButton() {
        viewModel.didPause()
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

}
