//
//  GameCycleProtocol.swift
//  Yokai Run
//
//  Created by Bof on 14/11/23.
//

import Foundation

extension GameViewController: CycleDelegate {
    
    func pauseStateChanged(newValue value: Bool) {
        pauseView.isHidden.toggle()
        gameScene?.view?.isPaused.toggle()
    }
    
    func appHasReturned() {
        gameScene?.view?.isPaused.toggle()
        pauseView.isHidden = false
    }
    
    func checkIfDead() {
        if (gameScene?.viewModel.gameInfo.stamina)! <= 0 {
            gameScene?.view?.isPaused.toggle()

            gameScene?.viewModel.gameInfo.isDead = true
            gameOverView.isHidden = false
        }
    }
    
}

protocol CycleDelegate: AnyObject {
    func pauseStateChanged(newValue value: Bool)
    
    func checkIfDead()

}
