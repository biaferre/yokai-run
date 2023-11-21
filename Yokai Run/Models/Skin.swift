//
//  Skin.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//

import Foundation

struct Skin {
    var summonerInfo: [String: Any] = [
        "name": "Summoner",
        "jpName": "召喚",
        "skinDescription": "",
        "powers": ["Summoning Yokai", "Sorcery"],
        "type": "Human",
        "imgNamed": "Basic"
    ]
    
    var tenguInfo: [String: Any] = [
        "name": "Uondo",
        "jpName": "天狗",
        "skinDescription": "",
        "powers": [""],
        "type": "Tengu (goblin-like)",
        "imgNamed": "Tengu"
    ]
    
    var uondoInfo: [String: Any] = [
        "name": "Uondo",
        "jpName": "魚人",
        "skinDescription": "Uondo is the daughter of a carp. She inherited the good looks of both of her parents, and is famous for her beautiful face.It is said that licking her skin adds years to ones’ life.",
        "powers": ["Water-dwelling","Rejuvenation"],
        "type": "Ningyo (mermaid-like)",
        "imgNamed": "Uondo"
    ]
    
    var gashadokuroInfo: [String: Any] = [
        "name": "Gashadokuro",
        "jpName": "がしゃどくろ",
        "skinDescription": "Made of the bones and the resentment of those buried without ceremony, a Gashadokuro is a gigantic skeleton whose rattling noises terrify anyone unlucky enough to hear th",
        "powers": ["Immortality", "Super strength"],
        "type": "Also known as Odokuro",
        "imgNamed": "Gashadokuro"
    ]
    
    func getSkinFromName(name: String) -> [String: Any] {
        var info: [String: Any] = [:]
        
        if name == "Summoner" {
            info = summonerInfo
        }
        else if name == "Tengu" {
            info = tenguInfo
        }
        else if name == "Uondo" {
            info = uondoInfo
        }
        else if name == "Gashadokuro" {
            info = gashadokuroInfo
        }
        else {
            print("Error: unexistant skin name")
        }
        
        return info
        
    }
    
}
