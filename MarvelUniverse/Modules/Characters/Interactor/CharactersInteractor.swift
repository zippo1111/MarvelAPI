//
//  CharactersInteractor.swift
//  CharactersInteractor
//
//  Created by Mangust on 30.04.2022.
//

import Foundation

final class CharactersInteractor {
    private(set) var dataStorage: CharacterDataStorage

    private let limit: Int?
    private let offset: Int?

    private enum State {
        case loading
        case ready([Character])
        case error
    }

    private var state: State = .loading {
        didSet {
            switch state {
            case .ready:
                break
//                viewMessage.isHidden = true
//                tblComics.isHidden = false
//                tblComics.reloadData()
            case .loading:
                break
//                tblComics.isHidden = true
//                viewMessage.isHidden = false
//                lblMessage.text = "Getting comics ..."
//                imgMeessage.image = #imageLiteral(resourceName: "Loading")
            case .error:
                break
//                tblComics.isHidden = true
//                viewMessage.isHidden = false
//                lblMessage.text = """
//                              Something went wrong!
//                              Try again later.
//                            """
//                imgMeessage.image = #imageLiteral(resourceName: "Error")
            }
        }
    }

    init(dataStorage: CharacterDataStorage) {
        self.dataStorage = dataStorage

        limit = dataStorage.limit
        offset = dataStorage.offset
    }
}

extension CharactersInteractor: CharactersInteractorInput {
    func loadCharacters() {
        marvelProvider.request(.characters(limit, offset)) { [weak self] result in
            switch result {
            case let .success(response):
                do {
                    self?.state = .ready(
                        try response.map(MarvelResponse<Character>.self).data.results
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
