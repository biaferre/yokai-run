//
//  GameScene+Collectibles.swift
//  Yokai Run
//
//  Created by Bof on 21/11/23.
//

import Foundation
import SpriteKit


extension GameScene {
    
    func setupCollectibles() {
        
        let obstaclePositions = GameComponentPlacement().obstacleNodes
        
        for i in 0...(obstacleNodes.count - 1) {
            obstacleNodes[i].name = "Obstacle-\(i)"
            obstacleNodes[i].anchorPoint = CGPoint(x: 0.5, y: 0.5)
            obstacleNodes[i].size = CGSize(width: self.frame.width*0.06, height: self.frame.height*0.17)
            obstacleNodes[i].position = obstaclePositions[i]
            
            obstacleNodes[i].zPosition = 5
            
            obstacleNodes[i].physicsBody = SKPhysicsBody(rectangleOf: obstacleNodes[i].size)
            obstacleNodes[i].physicsBody?.isDynamic = false
            
            obstacleNodes[i].physicsBody?.categoryBitMask = 4
            obstacleNodes[i].physicsBody?.contactTestBitMask = 1
                        
            self.addChild(obstacleNodes[i])
        }
    }
    
    func moveCollectibles(acceleration: CGFloat) {
        for i in 0...(obstacleNodes.count - 1) {
            obstacleNodes[i].position.x -= 2*acceleration
            
            if obstacleNodes[i].position.x <= -((self.scene?.size.width)!) {
                obstacleNodes[i].removeFromParent()
            }
        }
    }
    
}
