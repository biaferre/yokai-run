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
            
        // MARK: scene configurations
        
        let skView = SKView(frame: view.frame)
        view.addSubview(skView)
            
        let scene = GameScene(size: skView.bounds.size, gameInfo: viewModel.gameInfo)
        scene.scaleMode = .aspectFill
            
        skView.presentScene(scene)
        
        gameScene = scene
        
        
        // MARK: movement recognizer
        
//        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(GameViewController.swipeUpOccurred(swipe:)))
//        swipeUp.direction = .up
//        view.addGestureRecognizer(swipeUp)
//        
//        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(GameViewController.swipeDownOccurred(swipe:)))
//        swipeDown.direction = .down
//        view.addGestureRecognizer(swipeDown)
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    // MARK: swipe settings

//    @objc func swipeUpOccurred(swipe: UITapGestureRecognizer) {
//        print("swipe up")
//        gameScene?.jump()
//    }
//
//    @objc func swipeDownOccurred(swipe: UITapGestureRecognizer) {
//        print("swipe down")
//        gameScene?.slide()
//    }

    

}
