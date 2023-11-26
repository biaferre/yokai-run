//
//  GameComponentPlacement.swift
//  Yokai Run
//
//  Created by Bof on 21/11/23.
//

import Foundation

struct GameComponentPlacement {
    var obstacleNodes: [CGPoint] = [CGPoint(x: 100, y: 100),CGPoint(x: 2000, y: 2000),CGPoint(x: 2000, y: 2000)]
    
    var platformNodes: [CGPoint] = [CGPoint(x: 2000, y: 2000),CGPoint(x: 2000, y: 2000),CGPoint(x: 2000, y: 2000),CGPoint(x: 2000, y: 2000),CGPoint(x: 2000, y: 2000)]
    
    var collectibleNodes: [CGPoint] = [CGPoint(x: 560, y: 10)]
}
