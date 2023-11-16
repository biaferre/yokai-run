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
    
    static var shared = GameScene(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), gameInfo: GameViewModel().gameInfo)
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var groundNodes: [SKSpriteNode] = []
    
    var isJumping: Bool = false
    var isDoubleJumping: Bool = false
    
    var obstacleNodes = [SKSpriteNode(imageNamed: "Obstacle"),SKSpriteNode(imageNamed: "Obstacle"),SKSpriteNode(imageNamed: "Obstacle")]
    var platformNodes = [SKSpriteNode(imageNamed: "Platform"), SKSpriteNode(imageNamed: "Platform")]
    
    var heroNode = SKSpriteNode()
    var gameInfo: Game
    
    var player: Player?
    
    // MARK: inits

    private init(size: CGSize, gameInfo: Game) {
        self.gameInfo = gameInfo
                
        super.init(size: size)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
//    func loadPlayerInfo() {
//
//        let player = NSEntityDescription.insertNewObject(forEntityName: "Player", into: context) as! Player
//        self.player = player
//    }
    
    
    // MARK: basic functions

    override func didMove(to: SKView) {
        GameScene.shared = self
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -15.8)
        self.physicsWorld.contactDelegate = self
        
        self.scaleMode = .aspectFit
        
        isUserInteractionEnabled = true

        fetchPlayerData()
        
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

    func fetchPlayerData() {
        let fetchRequest: NSFetchRequest<Player> = Player.fetchRequest()
        do {
            if let player = try context.fetch(fetchRequest).first {
                self.player = player
            } else {
                player = Player(context: context)
                let skin = Skin(context: context)
                skin.owned = player
                
                do {
                    try context.save()
                }
                catch {
                    print("Failed to save player: \(error)")
                }

            }
        } catch {
            print("Failed to fetch player: \(error)")
        }
    }
}
