//
//  CharactersPresenter.swift
//  CharactersPresenter
//
//  Created by Mangust on 30.04.2022.
//

import Foundation

final class CharactersPresenter {
    private let router: CharactersRouterInput
    private let interactor: CharactersInteractorInput

    init(router: CharactersRouterInput, interactor: CharactersInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension CharactersPresenter: CharactersInteractorOutput {
    func showCharacters() {

    }
}

extension CharactersPresenter: CharactersViewOutput {
    func viewIsReady() {
        interactor.loadCharacters()
    }

    func didTapCell(at index: Int) {

    }
}
