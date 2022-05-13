//
//  CharactersConfigurator.swift
//  CharactersConfigurator
//
//  Created by Mangust on 30.04.2022.
//

import UIKit

final class CharactersConfigurator {

    func configureModule<UIViewController>(
        viewInput: UIViewController,
        dataStorage: CharacterDataStorage
    ) {
        if let viewController = viewInput as? CharactersTableViewController {
            let router = CharactersRouter(viewController: viewController)
            let presenter = CharactersPresenter(
                alertService: AlertService(),
                viewModelService: CharactersPresenterService()
            )
            let interactor = CharactersInteractor(
                dataStorage: dataStorage,
                output: presenter
            )

            presenter.router = router
            presenter.interactor = interactor

            viewController.output = presenter

            presenter.output = viewController
        }
    }

}
