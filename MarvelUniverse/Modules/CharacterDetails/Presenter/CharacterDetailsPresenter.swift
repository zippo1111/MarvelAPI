//
//  CharacterDetailsPresenter.swift
//  CharacterDetailsPresenter
//
//  Created by Mangust on 05.05.2022.
//

import Foundation

final class CharacterDetailsPresenter {
    weak var output: CharacterDetailsViewInput!
    var router: CharacterDetailsRouterInput!
    var interactor: CharacterDetailsInteractorInput!
}

extension CharacterDetailsPresenter: CharacterDetailsInteractorOutput {
    func loadView(with dataStorage: CharacterDetailsDataStorage) {
        guard let name = dataStorage.name,
              let description = dataStorage.description,
              let photoUrl = dataStorage.photoUrl
        else {
            return
        }

        let viewModel = CharacterDetailsViewModel(
            name: name,
            imageUrl: photoUrl,
            description: description
        )
        output.configureView(viewModel: viewModel)
    }
}

extension CharacterDetailsPresenter: CharacterDetailsViewOutput {
    func viewIsReady() {
        interactor.getDetails()
    }
}
