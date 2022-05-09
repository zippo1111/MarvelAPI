//
//  CharacterDetailsWireframe.swift
//  CharacterDetailsWireframe
//
//  Created by Mangust on 04.05.2022.
//

import UIKit

final class CharacterDetailsWireframe {
    private var viewController: CharacterDetailsViewController?

    let configurator = CharacterDetailsConfigurator()

    func initCharacterDetailsViewController(_ dataStorage: CharacterDetailsDataStorage) -> CharacterDetailsViewController {
        if viewController == nil {
            viewController = CharacterDetailsViewController()
        }

        configurator.configureModule(
            viewInput: viewController,
            dataStorage: dataStorage
        )

        return viewController!
    }
}
