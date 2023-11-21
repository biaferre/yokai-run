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
    
    private var cancellables: Set<AnyCancellable> = []

    init() {
        self.gameInfo = Game(heroSkin: "Tengu", // later implement switching with selection
                             heroInitialY: -60,
                             heroCurrentY: -60,
                             stamina: 100.0,
                             isImmune: false,
                             miles: 0,
                             acceleration: 1,
                             inCounter: false,
                             isPaused: false,
                             isDead: false)
        gameInfo.objectWillChange.sink {
            [weak self] in self?.objectWillChange.send()
        }.store(in: &cancellables)
    }
    
    func didPause() {
        gameInfo.isPaused.toggle()
    }

}
