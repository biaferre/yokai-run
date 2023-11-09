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
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            let skView = SKView(frame: view.frame)
            view.addSubview(skView)
            
            let scene = GameScene(size: skView.bounds.size)
            scene.scaleMode = .aspectFill
            
            skView.presentScene(scene)
    }
    
     override var prefersStatusBarHidden: Bool {
        return true
    }
}
