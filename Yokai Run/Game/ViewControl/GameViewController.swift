//
//  GameViewController.swift
//  Yokai Run
//
//  Created by Bof on 08/11/23.
//

import Foundation
import UIKit
import SpriteKit

class GameViewController: UIViewController, UISceneDelegate {
    
    var viewModel = GameViewModel()
    var gameScene: GameScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(pauseGame),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(resumeGame),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
        
        viewModel.gameInfo.cycleDelegate = self
        
            
        // MARK: scene configurations
        
        let skView = SKView(frame: view.frame)
        
        let scene = GameScene.shared
        scene.passViewModel(viewModel: viewModel)
        
        gameScene = scene
                
        view.addSubview(skView)
        view.addSubview(pauseButton)
        
        pauseView.addViewModel(gameViewModel: viewModel)
        
        pauseView.isHidden = !viewModel.gameInfo.isPaused
        gameOverView.isHidden = true

        skView.addSubview(pauseView)
        skView.addSubview(gameOverView)

        skView.presentScene(gameScene)
        
        setupLayout()

    }

    lazy var pauseButton: UIButton  = {
        let pauseButton = MinimalButtonComponent(text: "Pause", img: "Lotus").button
        pauseButton.addTarget(self, action: #selector(pauseGame), for: .touchDown)
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
    
    @objc func pauseGame() {
        viewModel.didPause()
    }
    
    @objc func resumeGame() {
        appHasReturned()
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    

}
