//
//  CharactersInteractorInput.swift
//  CharactersInteractorInput
//
//  Created by Mangust on 30.04.2022.
//

import Foundation

protocol CharactersInteractorInput {
    func loadInitialCharacters()
    func getDetailsDataStorage(at index: Int) -> CharacterDetailsDataStorage?
    func loadMore()
}
