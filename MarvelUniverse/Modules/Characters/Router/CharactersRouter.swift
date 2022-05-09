//
//  CharactersRouter.swift
//  CharactersRouter
//
//  Created by Mangust on 30.04.2022.
//

import Foundation

final class CharactersRouter: BaseRouter, CharactersRouterInput {
    func goToDetails(_ dataStorage: CharacterDetailsDataStorage) {
        let viewController = CharacterDetailsWireframe().initCharacterDetailsViewController(dataStorage)

        present(viewController, context: nil, animated: false, completion: nil)
    }
}
