//
//  CharactersWireframe.swift
//  CharactersWireframe
//
//  Created by Mangust on 30.04.2022.
//

import UIKit

final class CharactersWireframe {
    private var viewController: CharactersTableViewController?

    let configurator = CharactersConfigurator()

    func initCharactersViewController(
        dataStorage: CharacterDataStorage = CharacterDataStorage(limit: nil, offset: nil, characters: nil)
    ) -> CharactersTableViewController {
        if viewController == nil {
            viewController = CharactersTableViewController()
        }

        configurator.configureModule(
            viewInput: viewController,
            dataStorage: dataStorage
        )

        return viewController!
    }
}
