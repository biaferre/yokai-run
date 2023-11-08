////
////  ViewController.swift
////  Yokai Run
////
////  Created by Bof on 06/11/23.
////
//
//import UIKit
//import SpriteKit
//import SceneKit
//
//struct Yokai {
//    var image = ""
//    var name = ""
//    var description = ""
//    var color: UIColor = .red
//    
//    init(image: String = "", name: String = "", description: String = "", color: UIColor) {
//        self.image = image
//        self.name = name
//        self.description = description
//        self.color = color
//    }
//    
//}
//
//class Player: SKView {
//    var yokaiArchive: [Yokai] = [Yokai(image: "Hero", name: "main", description: "", color: .red)]
//    var heroSkin: SKSpriteNode
//    
//    init(heroSkin: SKSpriteNode) {
//        self.heroSkin = heroSkin
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
//
//class GameScene: SKScene {
//    
//    // Checks all the possible movement stages
//    var isJumping: Bool = false
//    var isDoubleJumping: Bool = false
//    var isSliding: Bool = false
//    var isMovinLeft: Bool = false
//    var isMovinRight: Bool = false
//    
//}
//
//class GameMenu: UIView {
//    
//}
//
//class GameViewController: UIViewController {
//    var scene: SKScene!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if let skView = self.view as? SKView {
//            scene = Player
//            setupScene()
//            
//            skView.backgroundColor = .blue
//            skView.presentScene(scene)
//        }
//    }
//        
//    private func setupScene() {
//        if let scene = self.scene as? SKScene {
//            scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//            let image = SKSpriteNode(imageNamed: "Hero")
//            scene.addChild(image)
//        }
//
//    }
//}
//
