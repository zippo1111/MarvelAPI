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
            let interactor = CharactersInteractor(dataStorage: dataStorage)
            let presenter = CharactersPresenter(router: router, interactor: interactor)

            viewController.output = presenter
        }
    }

}
