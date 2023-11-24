//
//  GameScene+Platforms.swift
//  Yokai Run
//
//  Created by Bof on 16/11/23.
//

import Foundation
import SpriteKit

extension GameScene {
    
    func setupPlatforms() {
        
        let platformPositions = componentPlacement.platformNodes

        
        for i in 0...(platformNodes.count - 1) {
            let platformArea: SKSpriteNode = SKSpriteNode(color: .clear, size:
                                                            CGSize(width: (self.frame.width*0.23 + 50), height: self.frame.height*0.06))
            
            platformNodes[i].name = "Platform-\(i)"
            platformNodes[i].anchorPoint = CGPoint(x: 0.5, y: 0.5)
            platformNodes[i].size = CGSize(width: self.frame.width*0.23, height: self.frame.height*0.06)
            platformNodes[i].position = platformPositions[i]
            
            platformNodes[i].zPosition = 20

            
            platformNodes[i].physicsBody = SKPhysicsBody(rectangleOf: platformNodes[i].size)
            platformNodes[i].physicsBody?.isDynamic = false
            
            platformNodes[i].physicsBody?.categoryBitMask = 8
            platformNodes[i].physicsBody?.contactTestBitMask = 1 | 16
            
            platformArea.addChild(platformNodes[i])
                        
            self.addChild(platformArea)
        }
        
    }
    
    func movePlatforms(acceleration: CGFloat) {
        for i in 0...(platformNodes.count - 1) {
            platformNodes[i].position.x -= 2*acceleration
            
            if platformNodes[i].position.x <= -((self.scene?.size.width)!) {
                platformNodes[i].removeFromParent()
            }
        }
    }
}
