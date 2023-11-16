//
//  Skin.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//

import Foundation

class Skin: NSObject {
    var name: String
    var jpName: String
    var skinDescription: String
    var powers: String
    var type: String
    var imgNamed: String
    
    init(name: String, jpName: String, skinDescription: String, powers: String, type: String, imgNamed: String) {
        self.name = name
        self.jpName = jpName
        self.skinDescription = skinDescription
        self.powers = powers
        self.type = type
        self.imgNamed = imgNamed
    }
    
}
