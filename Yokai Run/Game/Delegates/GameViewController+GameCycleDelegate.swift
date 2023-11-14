//
//  GameCycleProtocol.swift
//  Yokai Run
//
//  Created by Bof on 14/11/23.
//

import Foundation

extension GameViewController: GameCycleDelegate {
    
    func pauseStateChanged(newValue value: Bool) {
        gameScene?.view?.isPaused.toggle()
        pauseView.isHidden.toggle()
        print(pauseView.isHidden)
    }
    
    func checkIfDead() {
        print("levei um hit")
        if (gameScene?.gameInfo.stamina)! <= 0 {
            gameScene?.view?.isPaused.toggle()

            gameScene?.gameInfo.isDead = true
            gameOverView.isHidden = false
        }
    }
    
}

protocol GameCycleDelegate: AnyObject {
    func pauseStateChanged(newValue value: Bool)
    
    func checkIfDead()

}
