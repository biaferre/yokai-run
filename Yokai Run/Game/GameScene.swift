//
//  GameScene.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//
import Foundation
import SpriteKit
import CoreData

class GameScene: SKScene {
    
    var heroNode = SKSpriteNode()
    var viewModel: GameViewModel
    
    static var shared: GameScene {
        return GameScene(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), viewModel: GameViewModel())
    }
    
    // MARK: inits

    private init(size: CGSize, viewModel: GameViewModel) {
        self.viewModel = viewModel
                
        super.init(size: size)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: manager & placements

    let userDefaultsManager = UserDefaultsManager.shared
    let componentPlacement = GameComponentPlacement()
    
    
    // MARK: controls
    
    var isJumping: Bool = false
    var isDoubleJumping: Bool = false
    
    
    // MARK: components initializers
    
    var obstacleNodes = [SKSpriteNode(imageNamed: "Obstacle"),SKSpriteNode(imageNamed: "Obstacle"),SKSpriteNode(imageNamed: "Obstacle")]
    var platformNodes = [SKSpriteNode(imageNamed: "Platform"), SKSpriteNode(imageNamed: "Platform"), SKSpriteNode(imageNamed: "Platform"), SKSpriteNode(imageNamed: "Platform"), SKSpriteNode(imageNamed: "Platform")]
    var collectibleNodes = [SKSpriteNode(imageNamed: "Collectible")]
    var groundNodes: [SKSpriteNode] = []
    
    
    // MARK: basic functions
    
    func passViewModel(viewModel: GameViewModel) { // receives gameviewmodel from controller
        self.viewModel = viewModel
    }
    
    override func didMove(to: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -15.8)
        self.physicsWorld.contactDelegate = self
        
        self.scaleMode = .aspectFit
        
        self.view?.layer.opacity = 0
        
        isUserInteractionEnabled = true
        
        let background = SKSpriteNode(imageNamed: "Game-Bg")
        background.size = frame.size
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        
        self.addChild(background)
                
        fadeInAnimation()

        setupGrounds()
        setupHero()
        setupCollectibles()
        setupObstacles()
        setupPlatforms()
    }


    
    override func update(_ currentTime: TimeInterval) {
        // gradually accelerates game up to a limit
        if self.viewModel.gameInfo.acceleration <= 4 {
            self.viewModel.gameInfo.acceleration += 0.0001
        }
        
        // hero dies if its left behind
        if heroNode.position.x <= -((self.scene?.size.width)!/2 + heroNode.size.width) {
            self.viewModel.gameInfo.stamina = 0
        }
        
        // update components' positions
        moveGrounds(acceleration: viewModel.gameInfo.acceleration)
        moveObstacles(acceleration: viewModel.gameInfo.acceleration)
        movePlatforms(acceleration: viewModel.gameInfo.acceleration)
        moveCollectibles(acceleration: viewModel.gameInfo.acceleration)
    }
    
    func fadeInAnimation() {
        UIView.animate(withDuration: 0.5) {
            self.view?.layer.opacity = 1.0
        }
    }
    
}
