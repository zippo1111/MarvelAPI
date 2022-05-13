//
//  CharactersMock.swift
//  CharactersMock
//
//  Created by Mangust on 12.05.2022.
//

@testable import MarvelUniverse

enum DataStorageMock {
    static let character = Character(
        id: 1011175,
        name: "Adam Warlock",
        description: nil,
        thumbnail:
            Thumbnail(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/a/f0/5202887448860",
                extension: "jpg"
            ),
        resourceURI: "http://gateway.marvel.com/v1/public/characters/1010354"
    )

    static let characterDetails = CharacterDetailsDataStorage(
        name: nil,
        description: nil,
        photoUrl: nil
    )
}
