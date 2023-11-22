//
//  GameCycleProtocol.swift
//  Yokai Run
//
//  Created by Bof on 14/11/23.
//

import Foundation
import SpriteKit

extension GameViewController: CycleDelegate {
    
    func pauseStateChanged() {
        if !((gameScene?.viewModel.gameInfo.isDead)!) {
            pauseView.isHidden.toggle()
            gameScene?.view?.isPaused.toggle()
        }
    }
    
    func restartStateChanged() {
        print("restart")
        
    }
    
    func appHasReturned() {
        gameScene?.view?.isPaused.toggle()
        pauseView.isHidden = false
    }
    
    func checkIfDead() {
        let transition = SKTransition.fade(with: .black, duration: 1)
        let gameOverScene = GameOverScene(size: gameScene!.size)
        gameOverScene.score = (gameScene?.viewModel.gameInfo.miles)!
        gameOverScene.size = gameScene!.size
        gameOverScene.scaleMode = .fill
        
        if (gameScene?.viewModel.gameInfo.stamina)! <= 0 {
            gameScene?.viewModel.gameInfo.isDead = true
            gameScene?.view?.presentScene(gameOverScene, transition: transition)
        }
    }
    
}

protocol CycleDelegate: AnyObject {
    func pauseStateChanged()
    
    func restartStateChanged()
    
    func appHasReturned()
    
    func checkIfDead()

}
