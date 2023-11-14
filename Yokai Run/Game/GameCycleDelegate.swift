//
//  GameCycleProtocol.swift
//  Yokai Run
//
//  Created by Bof on 14/11/23.
//

import Foundation

protocol GameCycleDelegate: AnyObject {
    func pauseStateChanged(newValue value: Bool)
    
    func didGetHit(value: Int)
}
