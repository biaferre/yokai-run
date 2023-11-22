//
//  Skin.swift
//  Yokai Run
//
//  Created by Bof on 09/11/23.
//

import Foundation
import UIKit

class Skin: NSObject, NSCoding {
    
    var name: String
    var jpName: String
    var skinDescription: String
    var powers: [String]
    var type: String
    var imgNamed: String
    var isEnabled: Bool
    
    init(name: String, jpName: String, skinDescription: String, powers: [String], type: String, imgNamed: String, isEnabled: Bool) {
        self.name = name
        self.jpName = jpName
        self.skinDescription = skinDescription
        self.powers = powers
        self.type = type
        self.imgNamed = imgNamed
        self.isEnabled = isEnabled
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        jpName = aDecoder.decodeObject(forKey: "jpName") as? String ?? ""
        skinDescription = aDecoder.decodeObject(forKey: "skinDescription") as? String ?? ""
        powers = aDecoder.decodeObject(forKey: "powers") as? [String] ?? [""]
        type = aDecoder.decodeObject(forKey: "type") as? String ?? ""
        imgNamed = aDecoder.decodeObject(forKey: "imgNamed") as? String ?? ""
        isEnabled = aDecoder.decodeBool(forKey: "isEnabled")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(jpName, forKey: "jpName")
        coder.encode(skinDescription, forKey: "skinDescription")
        coder.encode(powers, forKey: "powers")
        coder.encode(type, forKey: "type")
        coder.encode(imgNamed, forKey: "imgNamed")
        coder.encode(isEnabled, forKey: "isEnabled")

    }
    
    static func encodeSkins(_ skins: [Skin]) -> Data? {
        return try? NSKeyedArchiver.archivedData(withRootObject: skins, requiringSecureCoding: false)
    }

    static func decodeSkins(from data: Data) -> [Skin]? {
        return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Skin]
    }

}
