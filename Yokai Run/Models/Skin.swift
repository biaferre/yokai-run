// Skin.swift
import Foundation

class Skin: NSObject, Codable {
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
    
    // MARK: - Codable
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        jpName = try container.decode(String.self, forKey: .jpName)
        skinDescription = try container.decode(String.self, forKey: .skinDescription)
        powers = try container.decode([String].self, forKey: .powers)
        type = try container.decode(String.self, forKey: .type)
        imgNamed = try container.decode(String.self, forKey: .imgNamed)
        isEnabled = try container.decode(Bool.self, forKey: .isEnabled)
    }

    // MARK: - Codable
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(jpName, forKey: .jpName)
        try container.encode(skinDescription, forKey: .skinDescription)
        try container.encode(powers, forKey: .powers)
        try container.encode(type, forKey: .type)
        try container.encode(imgNamed, forKey: .imgNamed)
        try container.encode(isEnabled, forKey: .isEnabled)
    }
    
    // MARK: - CodingKeys
    
    private enum CodingKeys: String, CodingKey {
        case name
        case jpName
        case skinDescription
        case powers
        case type
        case imgNamed
        case isEnabled
    }
}
