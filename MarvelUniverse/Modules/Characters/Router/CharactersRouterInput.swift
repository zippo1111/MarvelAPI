//
//  CharactersRouterInput.swift
//  CharactersRouterInput
//
//  Created by Mangust on 30.04.2022.
//

import Foundation

// sourcery: AutoMockable
protocol CharactersRouterInput: BaseRouterInput {
    func goToDetails(_ dataStorage: CharacterDetailsDataStorage)
}
