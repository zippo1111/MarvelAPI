//
//  CharacterDetailsConfigurator.swift
//  CharacterDetailsConfigurator
//
//  Created by Mangust on 05.05.2022.
//

import UIKit

final class CharacterDetailsConfigurator {

    func configureModule<UIViewController>(
        viewInput: UIViewController,
        dataStorage: CharacterDetailsDataStorage
    ) {
        if let viewController = viewInput as? CharacterDetailsViewController {
            let router = CharacterDetailsRouter(viewController: viewController)
            let presenter = CharacterDetailsPresenter()
            let interactor = CharacterDetailsInteractor(
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
