//
//  GameViewModel.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//

import Foundation

class GameViewModel {
    var gameInfo = Game(heroInfo: Hero(HeroSkin: "Tengu", // later implement switching with selection
                                       heroInitialY: -60,
                                       heroCurrentY: -60,
                                       stamina: 100.0,
                                       gotHit: false,
                                       gotStaminaBoost: false,
                                       isImmune: false),
                        miles: 0,
                        inCounter: false,
                        isPaused: false,
                        isDead: false)
}
