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
        let obstaclePositions: [CGPoint] = [CGPoint(x: 20, y: 100), CGPoint(x: 300, y: 10), CGPoint(x: 200, y: 100)]
        
        let obstacleNodes = [SKSpriteNode(imageNamed: "Obstacle"),SKSpriteNode(imageNamed: "Obstacle"),SKSpriteNode(imageNamed: "Obstacle")]
        
        for i in 0...(obstacleNodes.count - 1) {
            print(i)
            obstacleNodes[i].name = "Obstacle-\(i)"
            obstacleNodes[i].anchorPoint = CGPoint(x: 0.5, y: 0.5)
            obstacleNodes[i].size = CGSize(width: 200, height: 200)
            obstacleNodes[i].position = obstaclePositions[i]
            
            obstacleNodes[i].physicsBody = SKPhysicsBody(rectangleOf: obstacleNodes[i].size)
            obstacleNodes[i].physicsBody?.isDynamic = false
            
            obstacleNodes[i].physicsBody?.categoryBitMask = 4
            obstacleNodes[i].physicsBody?.contactTestBitMask = 1
                        
            self.addChild(obstacleNodes[i])

            
            
        }
    }
}
