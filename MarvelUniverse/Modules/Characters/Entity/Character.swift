//
//  Character.swift
//  Character
//
//  Created by Mangust on 03.05.2022.
//

import Foundation

public struct CharacterData: Codable {
    public var results: [Character]
    public let total: Int
    public let count: Int
}

public struct Character: Codable {
    public let id: Int
    public let name: String
    public let description: String?
    public let thumbnail: Thumbnail
    public let resourceURI: String
}

public struct Thumbnail: Codable {
    public let path: String
    public let `extension`: String

    public var url: URL {
        return URL(string: path + "." + `extension`)!
    }
}
