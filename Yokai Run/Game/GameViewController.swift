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
        
        viewModel.gameInfo.delegate = self
            
        // MARK: scene configurations
        
        let skView = SKView(frame: view.frame)
        
        let scene = GameScene(size: skView.bounds.size, gameInfo: viewModel.gameInfo)
        scene.scaleMode = .aspectFill
        
        gameScene = scene
                
        view.addSubview(skView)
        view.addSubview(pauseButton)
        
        pauseView.addViewModel(gameViewModel: viewModel)
        pauseView.isHidden = true
        print(pauseView.anchorPoint)

        skView.addSubview(pauseView)
        skView.presentScene(scene)
        
        setupLayout()

    }
    
    lazy var pauseButton: UIButton  = {
        let pauseButton = MinimalButtonComponent(text: "Pause", img: "Lotus").button
        pauseButton.addTarget(self, action: #selector(pausedButton), for: .touchDown)
        return pauseButton
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
    }
    
    
    @objc func pausedButton() {
        viewModel.didPause()
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

}

extension GameViewController: GameCycleDelegate {
    func didGetHit(value: Int) {
        print("contato")
    }
    
    func pauseStateChanged(newValue value: Bool) {
        gameScene?.view?.isPaused.toggle()
        pauseView.isHidden.toggle()
        print(pauseView.isHidden)
    }
    
}
