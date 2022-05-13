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

    private let viewModelService: CharacterDetailsPresenterServiceProtocol!

    init(viewModelService: CharacterDetailsPresenterServiceProtocol) {
        self.viewModelService = viewModelService
    }
}

extension CharacterDetailsPresenter: CharacterDetailsInteractorOutput {
    func loadView(with dataStorage: CharacterDetailsDataStorage) {
        guard let viewModel = viewModelService.getViewModel(dataStorage: dataStorage) else {
            return
        }

        output.configureView(viewModel: viewModel)
    }
}

extension CharacterDetailsPresenter: CharacterDetailsViewOutput {
    func viewIsReady() {
        interactor.getDetails()
    }
}
