//
//  GameModel.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//

import Foundation

class Game: ObservableObject {
    @Published var heroInfo: Hero
    @Published var miles: Int
    
    @Published var inCounter: Bool
    @Published var isPaused: Bool
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
