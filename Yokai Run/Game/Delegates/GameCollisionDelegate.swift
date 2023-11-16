//
//  GameContactDelegate.swift
//  Yokai Run
//
//  Created by Bof on 10/11/23.
//

import Foundation
import SpriteKit

extension GameScene: SKPhysicsContactDelegate {
    
    func absorbObstacle(obstacle: SKSpriteNode) {
        obstacle.removeFromParent()
    }
    
    struct ColliderType {
        static let HERO: UInt32 = 1
        static let ONGROUND: UInt32 = 2
        static let OBSTACLE: UInt32 = 4
        static let PLATFORM: UInt32 = 8
        static let YOKAI: UInt32 = 16

    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision: UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if collision == ColliderType.HERO | ColliderType.ONGROUND {
            isJumping = false
            isDoubleJumping = false
        }
        else if collision == ColliderType.HERO | ColliderType.OBSTACLE {
            absorbObstacle(obstacle: contact.bodyB.node as! SKSpriteNode)
            gameInfo.stamina -= 5
        }
        else if collision == ColliderType.HERO | ColliderType.PLATFORM {
            isJumping = false
            isDoubleJumping = false
            print("plataforma")
        }
    }

}
