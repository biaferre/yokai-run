//
//  GameContactDelegate.swift
//  Yokai Run
//
//  Created by Bof on 10/11/23.
//

import Foundation
import SpriteKit

class GameContactDelegate: NSObject, SKPhysicsContactDelegate {
    
    var isJumping: Bool = false
    var isDoubleJumping: Bool = false
    
    struct ColliderType {
        static let HERO: UInt32 = 1
        static let ONGROUND: UInt32 = 2
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision: UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if collision == ColliderType.HERO | ColliderType.ONGROUND {
            isJumping = false
            isDoubleJumping = false
        }
    }
}
