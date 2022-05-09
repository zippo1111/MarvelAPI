//
//  CharactersPresenter.swift
//  CharactersPresenter
//
//  Created by Mangust on 30.04.2022.
//

import Foundation
import UIKit

final class CharactersPresenter {
    weak var output: CharactersViewInput!
    var router: CharactersRouterInput!
    var interactor: CharactersInteractorInput!

    private func configureView(data: MarvelResults<Character>) {
        let characterViewModels = data.results.map {
            CharacterViewModel(
                title: $0.name,
                imageUrl: $0.thumbnail.url
            )
        }

        let viewModels = CharacterDataViewModel(
            total: data.total,
            count: data.count,
            characterViewModels: characterViewModels
        )

        output.configureView(viewModels: viewModels)
    }
}

extension CharactersPresenter: CharactersInteractorOutput {
    func load(data: MarvelResults<Character>) {
        configureView(data: data)
    }

    func loading() {
        output.setIsLoadingData()
    }

    func show(errorMessage: String, errorTitle: String) {
        output.showAlert(message: errorMessage, title: errorTitle)
    }
}

extension CharactersPresenter: CharactersViewOutput {
    func viewIsReady() {
        interactor.loadInitialCharacters()
    }

    func didTapCell(at index: Int) {
        guard let dataStorage = interactor.getDetailsDataStorage(at: index) else {
            return
        }

        router.goToDetails(dataStorage)
    }

    func didScrollToEnd() {
        interactor.loadMore()
    }
}
