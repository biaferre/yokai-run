//
//  UserDefaultsManager.swift
//  Yokai Run
//
//  Created by Bof on 21/11/23.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    let userDefaults = UserDefaults.standard
    
    private init() {
        let initialSkinSet = ["Uondo"]
        
        userDefaults.set(initialSkinSet, forKey: "AvailableSkins")
        userDefaults.set(initialSkinSet.first, forKey: "SelectedSkin")
    }

}
