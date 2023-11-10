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
    var pauseScene: PauseScene?
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
        // MARK: scene configurations
        
        let skView = SKView(frame: view.frame)
        view.addSubview(skView)
            
        let scene = GameScene(size: skView.bounds.size, gameInfo: viewModel.gameInfo)
        scene.scaleMode = .aspectFill
            
        skView.presentScene(scene)
        
        gameScene = scene
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func presentPauseScene() {
        let transitionFadeLength = 0.30
        let transitionFadeColor = UIColor.white
        let pauseTransition = SKTransition.fade(with: transitionFadeColor, duration: transitionFadeLength)
        pauseTransition.pausesOutgoingScene = true

        let currentSKView = view as! SKView
        currentSKView.presentScene(pauseScene!, transition: pauseTransition)
    }
    
    func unpauseGame() {
      let transitionFadeLength = 0.30
      let transitionFadeColor = UIColor.white
      let unpauseTransition = SKTransition.fade(with: transitionFadeColor, duration: transitionFadeLength)
      unpauseTransition.pausesIncomingScene = false

      let currentSKView = view as! SKView
      currentSKView.presentScene(gameScene!, transition: unpauseTransition)
    }

}
