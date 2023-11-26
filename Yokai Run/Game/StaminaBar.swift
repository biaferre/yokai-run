//
//  StaminaBar.swift
//  Yokai Run
//
//  Created by Bof on 25/11/23.
//

import Foundation
import UIKit
import SpriteKit

class StaminaBar: UIView {
    var staminaBarBg = UIView()
    var currentStaminaBar = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        staminaBarBg.frame.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        staminaBarBg.backgroundColor = .white

        currentStaminaBar.frame.size = CGSize(width: self.frame.size.width*0.95, height: self.frame.size.height*0.8)
        currentStaminaBar.backgroundColor = .systemRed
    

        self.addSubview(staminaBarBg)
        self.addSubview(currentStaminaBar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


//    func updateCurrentStamina(hitPoints: Int) {
//        self.currentStaminaBar.size.width = CGFloat((1-hitPoints))*self.currentStaminaBar.size.width/100
//    }
}
