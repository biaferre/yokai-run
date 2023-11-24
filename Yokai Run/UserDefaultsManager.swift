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
    
    var skins: [Skin]
    
    let selectedSkinKey = "SelectedSkin"
    let skinCollectionKey = "SkinCollection"
    
    let selectedSkin: Skin
        
    let initialHighScore = 0
    
    private init() {
        
        if let storedSkinsData = userDefaults.data(forKey: skinCollectionKey),
           let decodedSkins = try? JSONDecoder().decode([Skin].self, from: storedSkinsData) {
            self.skins = decodedSkins
        }
        else {
            print("No stored data.")

            self.skins = [
                Skin(name: "Summoner", jpName: "召喚", skinDescription: "", powers: ["Summoning Yokai", "Sorcery"], type: "Human", imgNamed: "Basic", isEnabled: true),
                Skin(name: "Tengu", jpName: "天狗", skinDescription: "Tengu (goblin-like)", powers: [], type: "", imgNamed: "Tengu", isEnabled: false),
                Skin(name: "Uondo", jpName: "魚人", skinDescription: "Uondo is the daughter of a carp. She inherited the good looks of both of her parents, and is famous for her beautiful face. It is said that licking her skin adds years to one’s life.", powers: ["Water-dwelling","Rejuvenation"], type: "Ningyo (mermaid-like)", imgNamed: "Uondo", isEnabled: false),
                Skin(name: "Gashadokuro", jpName: "がしゃどくろ", skinDescription: "Made of the bones and the resentment of those buried without ceremony, a Gashadokuro is a gigantic skeleton whose rattling noises terrify anyone unlucky enough to hear them.", powers: ["Immortality", "Super strength"], type: "Also known as Odokuro", imgNamed: "Gashadokuro", isEnabled: false)
            ]
            
            if let encodedSkins = try? JSONEncoder().encode(self.skins) {
                userDefaults.set(encodedSkins, forKey: skinCollectionKey)
                print("Encoded and saved default skins")
            }
        }
        
        if let storedSelectedSkinData = userDefaults.data(forKey: selectedSkinKey),
           let decodedSelectedSkin = try? JSONDecoder().decode(Skin.self, from: storedSelectedSkinData) {
            self.selectedSkin = decodedSelectedSkin
        }
        
        else {
            self.selectedSkin = Skin(name: "Summoner", jpName: "召喚", skinDescription: "", powers: ["Summoning Yokai", "Sorcery"], type: "Human", imgNamed: "Basic", isEnabled: true)
            
            if let encodedSelectedSkin = try? JSONEncoder().encode(selectedSkin) {
                userDefaults.set(encodedSelectedSkin, forKey: selectedSkinKey)
            }
        }
        
        userDefaults.set(initialHighScore, forKey: "HighScore")
    }

    

}
