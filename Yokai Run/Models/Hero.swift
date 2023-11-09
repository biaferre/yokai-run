//
//  HeroModel.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//

import Foundation

struct Hero {
    var HeroSkin: String
    var heroInitialY: CGFloat
    var heroCurrentY: CGFloat
    
    var stamina: CGFloat
    
    var gotHit: Bool
    var gotStaminaBoost: Bool
    var isImmune: Bool
}
