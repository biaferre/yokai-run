//
//  GameScene+Hero.swift
//  Yokai Run
//
//  Created by Bof on 13/11/23.
//

import Foundation
import SpriteKit

extension GameScene {
    // MARK: hero setup
    func setupHero() {
        let hero = SKSpriteNode(imageNamed: "Tengu")
        hero.name = "Hero"
        hero.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        hero.size = CGSize(width: (self.scene?.size.width)!*0.14, height: ((self.scene?.size.height)!*0.42))
        hero.position = CGPoint(x: -((self.scene?.size.width)!)/3, y: -60)
        
        hero.physicsBody = SKPhysicsBody(rectangleOf: hero.size)
        hero.physicsBody?.isDynamic = true
        hero.physicsBody?.categoryBitMask = 1
        hero.physicsBody?.contactTestBitMask = 2 | 4 | 8 | 16
        
        hero.physicsBody?.restitution = 0.0
        
        let uprightConstraint = SKConstraint.zRotation(SKRange(constantValue: 0.0))
        
        hero.constraints = [uprightConstraint]
        
        heroNode = hero
        self.addChild(heroNode)
    }
    
    func jump(withImpulse impulse: CGFloat) {
        heroNode.physicsBody?.applyImpulse(CGVector(dx: 0, dy: impulse))

    }
}
