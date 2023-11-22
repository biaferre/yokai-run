//
//  GameModel.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//

import Foundation

class Game: ObservableObject {
    weak var cycleDelegate: CycleDelegate?
    
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
    
    @Published var acceleration: CGFloat
    
    @Published var inCounter: Bool
    @Published var isPaused: Bool {
        didSet {
            cycleDelegate?.pauseStateChanged()
        }
    }
        
    @Published var isDead: Bool
    
    @Published var hasRestarted: Bool {
        didSet {
            cycleDelegate?.restartStateChanged()
        }
    }

        
    init(heroSkin: String, heroInitialY: CGFloat, heroCurrentY: CGFloat, stamina: CGFloat, isImmune: Bool, miles: Int, acceleration: CGFloat, inCounter: Bool, isPaused: Bool, isDead: Bool, hasRestarted: Bool) {
        self.heroSkin = heroSkin
        self.heroInitialY = heroInitialY
        self.heroCurrentY = heroCurrentY
        self.stamina = stamina
        self.isImmune = isImmune
        self.miles = miles
        self.acceleration = acceleration
        self.inCounter = inCounter
        self.isPaused = isPaused
        self.isDead = isDead
        self.hasRestarted = hasRestarted
    }

}
