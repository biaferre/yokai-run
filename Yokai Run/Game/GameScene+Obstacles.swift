//
//  GameScene+Obstacles.swift
//  Yokai Run
//
//  Created by Bof on 14/11/23.
//

import Foundation
import SpriteKit

extension GameScene {
    func setupObstacles() {
        
        let obstaclePositions: [CGPoint] = [
            CGPoint(x: 100, y: -60),
            CGPoint(x: 200, y: -60),
            CGPoint(x: 400, y: -60)
        ]
        
        for i in 0...(obstacleNodes.count - 1) {
            obstacleNodes[i].name = "Obstacle-\(i)"
            obstacleNodes[i].anchorPoint = CGPoint(x: 0.5, y: 0.5)
            obstacleNodes[i].size = CGSize(width: 40, height: 40)
            obstacleNodes[i].position = obstaclePositions[i]
            
            obstacleNodes[i].physicsBody = SKPhysicsBody(rectangleOf: obstacleNodes[i].size)
            obstacleNodes[i].physicsBody?.isDynamic = false
            
            obstacleNodes[i].physicsBody?.categoryBitMask = 4
            obstacleNodes[i].physicsBody?.contactTestBitMask = 1
                        
            self.addChild(obstacleNodes[i])
        }
    }
    
    func moveObstacles() {
        for i in 0...(obstacleNodes.count - 1) {
            obstacleNodes[i].position.x -= 2
            
            if obstacleNodes[i].position.x <= -((self.scene?.size.width)!)/2 {
                obstacleNodes[i].removeFromParent()
            }
        }
    }
}
