//
//  GameScene.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//

import SpriteKit

class GameScene: SKScene {
    
    var groundNodes: [SKSpriteNode] = []
    
    var heroNode = SKSpriteNode()
    
    override func didMove(to: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        setupGrounds()
        setupHero()
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveGrounds()
        
    }

    func setupGrounds() {
        for i in 0...3 {
            let ground = SKSpriteNode(imageNamed: "Grounds")
            ground.name = "Ground"
            ground.size = CGSize(width: (self.scene?.size.width)!, height: 250)
            ground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            ground.position = CGPoint(x: CGFloat(i) * ground.size.width, y: -(self.frame.size.height / 1.5))
            
            self.addChild(ground)
            groundNodes.append(ground)
            groundNodes.remove(at: 0)
        }
    }
    
    func moveGrounds() {
        self.enumerateChildNodes(withName: "Ground", using: ({
            (node, error) in
            
            node.position.x -= 2
            
            if node.position.x < -((self.scene?.size.width)!) {
                node.position.x += (self.scene?.size.width)! * 3
            }
        }))
    }
    
    func setupHero() {
        let hero = SKSpriteNode(imageNamed: "Tengu")
        hero.name = "Hero"
        hero.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        hero.position = CGPoint(x: -((self.scene?.size.width)!)/3, y: -60)
        
        heroNode = hero
        self.addChild(heroNode)
    }
    
}
