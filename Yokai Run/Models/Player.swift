//
//  PlayerModel.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//

import Foundation
import CoreData

class Player: NSManagedObject {
    @NSManaged var record: Int
    @NSManaged var skins: [Skin]
}
