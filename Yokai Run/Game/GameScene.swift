//
//  GameScene.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//
import Foundation
import SpriteKit

class GameScene: SKScene {
    let contactDelegate = GameCollisionDelegate()
    
    var groundNodes: [SKSpriteNode] = []
    var obstacleNodes: [SKSpriteNode] = []
    var heroNode = SKSpriteNode()
    var gameInfo: Game
    
    
    // MARK: inits functions

    init(size: CGSize, gameInfo: Game) {
        self.gameInfo = gameInfo
        
        super.init(size: size)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: basic functions

    override func didMove(to: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -15.8)
        self.physicsWorld.contactDelegate = contactDelegate
        
        self.scaleMode = .aspectFit
        
        isUserInteractionEnabled = true

        
        setupGrounds()
        setupHero()
        setupObstacles()
        setupGUI()
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveGrounds()
    }
    
    // MARK: movement functions
    
    func moveGrounds() {
        self.enumerateChildNodes(withName: "Ground", using: ({
            (node, error) in
            
            node.position.x -= 2
            
            if node.position.x < -((self.scene?.size.width)!) {
                node.position.x += (self.scene?.size.width)! * 3
            }
        }))
    }
    
    func jump(withImpulse impulse: CGFloat) {
        heroNode.physicsBody?.applyImpulse(CGVector(dx: 0, dy: impulse))

    }
    
}
