//
//  CharactersPresenterService.swift
//  CharactersPresenterService
//
//  Created by Mangust on 13.05.2022.
//

// sourcery: AutoMockable
protocol CharactersPresenterServiceProtocol {
    func getViewModel(data: MarvelResults<Character>) -> CharacterDataViewModel
}

final class CharactersPresenterService: CharactersPresenterServiceProtocol {
    func getViewModel(data: MarvelResults<Character>) -> CharacterDataViewModel {
        let characterViewModels = data.results.map {
            CharacterViewModel(
                title: $0.name,
                imageUrl: $0.thumbnail.url
            )
        }

        return CharacterDataViewModel(
            total: data.total,
            count: data.count,
            characterViewModels: characterViewModels
        )
    }
}
