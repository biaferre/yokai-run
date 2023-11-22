//
//  GameOverView.swift
//  Yokai Run
//
//  Created by Bof on 16/11/23.
//

import Foundation
import UIKit
import SpriteKit

class GameOverScene: SKScene {
    
    var score: Int = 0
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.backgroundColor = .green

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMove(to view: SKView) {
    }
    
}
