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

    private let viewModelService: CharactersPresenterServiceProtocol!
    private let alertService: AlertProtocol!

    init(alertService: AlertProtocol, viewModelService: CharactersPresenterServiceProtocol) {
        self.alertService = alertService
        self.viewModelService = viewModelService
    }

    private func configureView(data: MarvelResults<Character>) {
        let viewModels = viewModelService.getViewModel(data: data)
        output.configureView(viewModels: viewModels)
    }
}

extension CharactersPresenter: CharactersInteractorOutput {
    func updateView(with data: MarvelResults<Character>) {
        configureView(data: data)
    }

    func show(errorMessage: String, errorTitle: String) {
        output.showAlert(alertService, message: errorMessage, title: errorTitle)
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

    func search(name startWith: String) {
        interactor.search(name: startWith)
    }
}
