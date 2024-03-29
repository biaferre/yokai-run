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
        var skin: Skin = Skin(name: "fake", jpName: "fake", skinDescription: "fake", powers: [], type: "fake", imgNamed: "fake", isEnabled: true)
        if let storedSelectedSkinData = UserDefaultsManager.shared.userDefaults.value(forKey: UserDefaultsManager.shared.selectedSkinKey),
           let decodedSelectedSkin = try? JSONDecoder().decode(Skin.self, from: storedSelectedSkinData as! Data) {
            skin = decodedSelectedSkin
        }
        print("com o heroi: \(skin.name)")
        let hero = SKSpriteNode(imageNamed: skin.imgNamed)
        hero.name = "Hero"
        hero.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        hero.size = CGSize(width: (self.scene?.size.width)!*0.14, height: ((self.scene?.size.height)!*0.42))
        hero.position = CGPoint(x: -((self.scene?.size.width)!)/2.75, y: -60)
        
        hero.physicsBody = SKPhysicsBody(rectangleOf: hero.size)
        hero.physicsBody?.isDynamic = true
        hero.physicsBody?.categoryBitMask = 1
        hero.physicsBody?.contactTestBitMask = 2 | 4 | 8 | 16
        
        hero.zPosition = 10
        
        hero.physicsBody?.restitution = 0.0
        
        let uprightConstraint = SKConstraint.zRotation(SKRange(constantValue: 0.0))
        
        hero.constraints = [uprightConstraint]
        
        heroNode = hero
        self.addChild(heroNode)
    }
    
    func jump(withImpulse impulse: CGFloat) {
        heroNode.physicsBody?.applyImpulse(CGVector(dx: 0, dy: impulse))

    }
    
    func receiveDamage() {
//        heroNode.texture = SKTexture(imageNamed: heroNode.normalTexture.im)
    }
}
