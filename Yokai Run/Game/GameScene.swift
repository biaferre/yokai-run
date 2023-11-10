//
//  GameScene.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//

import SpriteKit

struct ColliderType {
    static let Hero: UInt32 = 1
    static let Grounds: UInt32 = 2
}


class GameScene: SKScene, ObservableObject {
    let contactDelegate = GameContactDelegate()
    
    var groundNodes: [SKSpriteNode] = []
    var heroNode = SKSpriteNode()
    var gameInfo: Game
    
    
    // MARK: basic initializers
    init(size: CGSize, gameInfo: Game) {
        self.gameInfo = gameInfo
        
        super.init(size: size)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -15.8)
        self.physicsWorld.contactDelegate = contactDelegate

        setupGrounds()
        setupHero()
    }
    
    
    // MARK: updating functions
    override func update(_ currentTime: TimeInterval) {
        moveGrounds()
    }
    

    
    // MARK: scenery setups
    func setupGrounds() {
        for i in 0...3 {
            let ground = SKSpriteNode(imageNamed: "Grounds")
            ground.name = "Ground"
            ground.size = CGSize(width: (self.scene?.size.width)!, height: 250)
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
    
    func moveGrounds() {
        self.enumerateChildNodes(withName: "Ground", using: ({
            (node, error) in
            
            node.position.x -= 2
            
            if node.position.x < -((self.scene?.size.width)!) {
                node.position.x += (self.scene?.size.width)! * 3
            }
        }))
    }
    
    
    // MARK: hero setup
    func setupHero() {
        let hero = SKSpriteNode(imageNamed: "Tengu")
        hero.name = "Hero"
        hero.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        hero.position = CGPoint(x: -((self.scene?.size.width)!)/3, y: -60)
        
        hero.physicsBody = SKPhysicsBody(rectangleOf: hero.size)
        hero.physicsBody?.isDynamic = true
        
        hero.physicsBody?.categoryBitMask = 1
        hero.physicsBody?.contactTestBitMask = 2
        
        hero.physicsBody?.restitution = 0.0
        
        let uprightConstraint = SKConstraint.zRotation(SKRange(constantValue: 0.0))
        hero.constraints = [uprightConstraint]
        
        heroNode = hero
        self.addChild(heroNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !contactDelegate.isDoubleJumping else {
            return
        }

        if contactDelegate.isJumping {
            contactDelegate.isDoubleJumping = true
            jump(withImpulse: 500)
        }
        else {
            contactDelegate.isJumping = true
            jump(withImpulse: 520)
        }
    }
    
    func jump(withImpulse impulse: CGFloat) {
        heroNode.physicsBody?.applyImpulse(CGVector(dx: 0, dy: impulse))

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    func touchDown(atPoint pos: CGPoint) {
    }
    
    func touchUp(atPoint pos: CGPoint) {
        heroNode.texture = SKTexture(imageNamed: "Tengu")
    }

    
    func slide() {
        
    }
    
    
}
