//
//  GameScene+Collectibles.swift
//  Yokai Run
//
//  Created by Bof on 21/11/23.
//

import Foundation
import SpriteKit


extension GameScene {
    
    func setupCollectibles() {
        
        let collectiblePositions = componentPlacement.collectibleNodes
                
        for i in 0...(collectibleNodes.count - 1) {
            collectibleNodes[i].name = "Collectible-\(i)"
            collectibleNodes[i].anchorPoint = CGPoint(x: 0.5, y: 0.5)
            collectibleNodes[i].size = CGSize(width: self.frame.width*0.06, height: self.frame.height*0.17)
            collectibleNodes[i].position = collectiblePositions[i]
            
            collectibleNodes[i].zPosition = 5
            
            collectibleNodes[i].physicsBody = SKPhysicsBody(rectangleOf: collectibleNodes[i].size)
            collectibleNodes[i].physicsBody?.isDynamic = false
            
            collectibleNodes[i].physicsBody?.categoryBitMask = 16
            collectibleNodes[i].physicsBody?.contactTestBitMask = 1
                        
            self.addChild(collectibleNodes[i])
        }
    }
    
    func moveCollectibles(acceleration: CGFloat) {
        for i in 0...(collectibleNodes.count - 1) {
            collectibleNodes[i].position.x -= 2*acceleration
            
            if collectibleNodes[i].position.x <= -((self.scene?.size.width)!) {
                collectibleNodes[i].removeFromParent()
            }
        }
    }
    
    func hasCollectedSkin(node: SKSpriteNode) {
        var skins: [Skin] = []
        if let storedSkinsData = UserDefaultsManager.shared.userDefaults.value(forKey: userDefaultsManager.skinCollectionKey), let decodedSkins = try? JSONDecoder().decode([Skin].self, from: storedSkinsData as! Data) {
            skins = decodedSkins
            
            print("skins: \(skins.count)")
            
            let disabledSkins = skins.filter { !$0.isEnabled }
            
            print(disabledSkins)
            
            if let collectedSkin = disabledSkins.randomElement() {
                print(collectedSkin.name)
                skins[skins.firstIndex(of: collectedSkin)!] = (collectedSkin.enableSkin())
                
                print("got skin: \(String(describing: collectedSkin.name))")
                
                
                if let encodedSkins = try? JSONEncoder().encode(skins) {
                    UserDefaultsManager.shared.userDefaults.set(encodedSkins, forKey: UserDefaultsManager.shared.skinCollectionKey)
                    print("Encoded and saved updated skins")
                }
            }
                
            }
        
        //absorbCollectible(collectible: node)
        }
    
}
