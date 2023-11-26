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
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectedSkinDidChange), name: Notification.Name("SelectedSkinDidChange"), object: nil)

        
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
                
        let scene = GameScene.shared
        scene.passViewModel(viewModel: viewModel)
        
        gameScene = scene
                
        let skView = SKView(frame: view.frame)
        
        staminaBar.frame.size = CGSize(width: self.view.frame.size.width*0.2, height: self.view.frame.size.height*0.06)
        staminaBar.center = CGPoint(x: self.view.frame.midX - 200, y: self.view.frame.midY + 100)
        
        view.addSubview(staminaBar)

        view.addSubview(skView)
        view.addSubview(pauseButton)
                
        pauseView.addViewModel(gameViewModel: viewModel)
        pauseView.isHidden = !viewModel.gameInfo.isPaused

        skView.addSubview(pauseView)
        skView.presentScene(gameScene)
        
        setupLayout()

    }
    
    @objc func selectedSkinDidChange() {
        print("nova skin é \(UserDefaultsManager.shared.selectedSkin)")
    }

    lazy var pauseButton: UIButton  = {
        let pauseButton = MinimalButtonComponent(text: "Pause", img: "Lotus").button
        pauseButton.addTarget(self, action: #selector(pauseGame), for: .touchDown)
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
    
    var staminaBar: UIView = {
        let bar = StaminaBar()
        bar.layer.zPosition = 10

        return bar
    }()
    
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
