//
//  GameModel.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//

import Foundation

class Game: ObservableObject {
    weak var cycleDelegate: GameCycleDelegate?

    
    @Published var heroSkin: String
    
    @Published var heroInitialY: CGFloat
    @Published var heroCurrentY: CGFloat
    
    @Published var stamina: CGFloat {
        didSet {
            cycleDelegate?.checkIfDead()
        }
    }
    
    @Published var isImmune: Bool
    
    @Published var miles: Int
    
    @Published var inCounter: Bool
    @Published var isPaused: Bool {
        didSet {
            cycleDelegate?.pauseStateChanged(newValue: isPaused)
        }
    }
    
    @Published var isDead: Bool
        
    init(heroSkin: String, heroInitialY: CGFloat, heroCurrentY: CGFloat, stamina: CGFloat, isImmune: Bool, miles: Int, inCounter: Bool, isPaused: Bool, isDead: Bool) {
        self.heroSkin = heroSkin
        self.heroInitialY = heroInitialY
        self.heroCurrentY = heroCurrentY
        self.stamina = stamina
        self.isImmune = isImmune
        self.miles = miles
        self.inCounter = inCounter
        self.isPaused = isPaused
        self.isDead = isDead
    }

}
