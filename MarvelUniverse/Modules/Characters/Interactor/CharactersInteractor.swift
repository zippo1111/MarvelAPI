//
//  CharactersInteractor.swift
//  CharactersInteractor
//
//  Created by Mangust on 30.04.2022.
//

import Foundation

final class CharactersInteractor {
    private(set) var dataStorage: CharacterDataStorage
    private(set) weak var output: CharactersInteractorOutput!

    private var characters: [Character]?
    private var offset = 0

    private enum State {
        case loading
        case ready(MarvelResults<Character>)
        case loadMore(MarvelResults<Character>)
        case error
    }

    private enum Constants {
        static let defaultLimit = 20
        static let defaultOffset = 20
        static let errorTitle = "Error:"
        static let errorMessage = "Error:"
    }

    private var state: State = .loading {
        didSet {
            switch state {
            case .ready(let data):
                self.characters = data.results

                output.load(data: data)
            case .loadMore(var mutableData):
                self.characters?.append(contentsOf: mutableData.results)

                if let characters = self.characters {
                    mutableData.results = characters
                }

                output.load(data: mutableData)
            case .loading:
                output.loading()
            case .error:
                output.show(
                    errorMessage: Constants.errorMessage,
                    errorTitle: Constants.errorTitle
                )
            }
        }
    }

    init(
        dataStorage: CharacterDataStorage,
        output: CharactersInteractorOutput
    ) {
        self.dataStorage = dataStorage
        self.output = output
    }
}

extension CharactersInteractor: CharactersInteractorInput {
    func loadInitialCharacters() {
        marvelProvider.request(.characters(nil, nil)) { [weak self] result in
            switch result {
            case let .success(response):
                do {
                    self?.state = .ready(
                        try response.map(MarvelResponse<Character>.self).data
                    )
                } catch {
                    self?.state = .error
                }
            case .failure(_):
                self?.state = .error
            }
        }
    }

    func getDetailsDataStorage(at index: Int) -> CharacterDetailsDataStorage? {
        guard let character = characters?[index] else {
            return nil
        }

        return CharacterDetailsDataStorage(
            name: character.name,
            description: character.description,
            photoUrl: character.thumbnail.url
        )
    }

    func loadMore() {
        offset += Constants.defaultOffset

        marvelProvider.request(
            .characters(Constants.defaultLimit, offset)
        ) { [weak self] result in
            switch result {
            case let .success(response):
                do {
                    self?.state = .loadMore(
                        try response.map(MarvelResponse<Character>.self).data
                    )
                } catch {
                    self?.state = .error
                }
            case .failure(_):
                self?.state = .error
            }
        }
    }
}
