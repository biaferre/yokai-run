//
//  GameModel.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//

import Foundation

protocol PauseDelegate: AnyObject {
    func pauseStateChanged(newValue value: Bool)
}

class Game: ObservableObject {
    @Published var heroInfo: Hero
    @Published var miles: Int
    
    weak var delegate: PauseDelegate?
    
    @Published var inCounter: Bool
    @Published var isPaused: Bool {
        didSet {
            delegate?.pauseStateChanged(newValue: isPaused)
        }
    }
    
    @Published var isDead: Bool
    
    @Published var gotHit: Bool = false
    
    init(heroInfo: Hero, miles: Int, inCounter: Bool, isPaused: Bool, isDead: Bool) {
        self.heroInfo = heroInfo
        self.miles = miles
        self.inCounter = inCounter
        self.isPaused = isPaused
        self.isDead = isDead
    }

}
