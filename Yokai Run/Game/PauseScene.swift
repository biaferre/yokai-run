//
//  PauseScene.swift
//  Yokai Run
//
//  Created by Bof on 10/11/23.
//

import Foundation
import SpriteKit

class PauseScene: SKScene {
    override func didMove(to view: SKView) {
        setupScene()
    }
    
    func setupScene() {
        self.backgroundColor = .systemPink
    }
}
