//
//  GameOverView.swift
//  Yokai Run
//
//  Created by Bof on 16/11/23.
//

import Foundation
import UIKit
import SpriteKit

class GameOverScene: SKScene {
    
    var score: Int = 0
        
    override init(size: CGSize) {
        super.init(size: size)
        
        self.backgroundColor = .green
        
        menuButton.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
        
        let button = menuButton
        
        self.addChild(button)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMove(to view: SKView) {
    }
    
    var menuButton: SKSpriteNode = {
        var button = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 44))
        
        return button
     }()
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if menuButton.contains(location) {
                menuAction()
            }
        }
    }
    
    func menuAction() {
        NavigationManager.shared.popViewController(animated: true)
    }
    
}
