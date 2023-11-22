//
//  GameViewModel.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//

import Foundation
import Combine

class GameViewModel: ObservableObject {

    @Published var gameInfo: Game
    
    var userDefaultsManager = UserDefaultsManager.shared
    
    let initialGameInfo = Game(heroSkin: "Summoner",
                               heroInitialY: -60,
                               heroCurrentY: -60,
                               stamina: 100.0,
                               isImmune: false,
                               miles: 0,
                               acceleration: 1,
                               inCounter: false,
                               isPaused: false,
                               isDead: false,
                               hasRestarted: false)
    
    private var cancellables: Set<AnyCancellable> = []

    init() {
        self.gameInfo = initialGameInfo
        gameInfo.objectWillChange.sink {
            [weak self] in self?.objectWillChange.send()
        }.store(in: &cancellables)
    }
    
    func didPause() {
        gameInfo.isPaused.toggle()
    }
    
    func restart() {
        gameInfo.hasRestarted.toggle()
    }

}
