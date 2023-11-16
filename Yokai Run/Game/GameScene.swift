//
//  GameScene.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//
import Foundation
import SpriteKit

class GameScene: SKScene {    
    var groundNodes: [SKSpriteNode] = []
    
    var isJumping: Bool = false
    var isDoubleJumping: Bool = false
    
    var obstacleNodes = [SKSpriteNode(imageNamed: "Obstacle"),SKSpriteNode(imageNamed: "Obstacle"),SKSpriteNode(imageNamed: "Obstacle")]
    var platformNodes = [SKSpriteNode(imageNamed: "Platform"), SKSpriteNode(imageNamed: "Platform")]
    
    var heroNode = SKSpriteNode()
    var gameInfo: Game
    
    
    
    // MARK: inits

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
        self.physicsWorld.contactDelegate = self
        
        self.scaleMode = .aspectFit
        
        isUserInteractionEnabled = true

        
        setupGrounds()
        setupHero()
        setupObstacles()
        setupPlatforms()
        setupGUI()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if heroNode.position.x <= -((self.scene?.size.width)!/2 + heroNode.size.width) {
            gameInfo.stamina = 0
        }
        moveGrounds()
        moveObstacles()
        movePlatforms()
    }
}
