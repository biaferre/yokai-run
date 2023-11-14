//
//  GameScene+Grounds.swift
//  Yokai Run
//
//  Created by Bof on 13/11/23.
//

import Foundation
import SpriteKit

extension GameScene {
    func setupGrounds() {
        for i in 0...3 {
            let ground = SKSpriteNode(imageNamed: "Grounds")
            ground.name = "Ground"
            ground.size = CGSize(width: (self.scene?.size.width)!, height: ((self.scene?.size.height)!/1.5))
            ground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            ground.position = CGPoint(x: CGFloat(i) * ground.size.width, y: -(self.frame.size.height / 1.5))
            
            ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
            ground.physicsBody?.isDynamic = false
            
            ground.physicsBody?.categoryBitMask = 2
            
            self.addChild(ground)
            groundNodes.append(ground)
            groundNodes.remove(at: 0)
        }
    }
}
