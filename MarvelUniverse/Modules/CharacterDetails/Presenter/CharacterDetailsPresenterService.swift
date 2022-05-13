//
//  CharacterDetailsPresenterService.swift
//  CharacterDetailsPresenterService
//
//  Created by Mangust on 13.05.2022.
//

// sourcery: AutoMockable
protocol CharacterDetailsPresenterServiceProtocol {
    func getViewModel(dataStorage: CharacterDetailsDataStorage) -> CharacterDetailsViewModel?
}

final class CharacterDetailsPresenterService: CharacterDetailsPresenterServiceProtocol {
    func getViewModel(dataStorage: CharacterDetailsDataStorage) -> CharacterDetailsViewModel? {
        guard let name = dataStorage.name,
              let description = dataStorage.description,
              let photoUrl = dataStorage.photoUrl
        else {
            return nil
        }

        return CharacterDetailsViewModel(
            name: name,
            imageUrl: photoUrl,
            description: description
        )
    }
}
