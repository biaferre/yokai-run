//
//  GameScene+TouchesBegan.swift
//  Yokai Run
//
//  Created by Bof on 13/11/23.
//

import Foundation
import UIKit
import SpriteKit

extension GameScene {
    
    // MARK: interaction trackers
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {
                
                guard !self.isDoubleJumping else {
                    return
                }
                
                if self.isJumping {
                    self.isDoubleJumping = true
                    jump(withImpulse: 320)
                }
                else {
                    self.isJumping = true
                    jump(withImpulse: 580)
                }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    // MARK: skin update

    func touchDown(atPoint pos: CGPoint) {
        //heroNode.texture = SKTexture(imageNamed: "Tengu")
    }
    
    func touchUp(atPoint pos: CGPoint) {
        //heroNode.texture = SKTexture(imageNamed: "Tengu")
    }
    
}
