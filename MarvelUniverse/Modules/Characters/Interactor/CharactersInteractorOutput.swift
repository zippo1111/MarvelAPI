//
//  CharactersInteractorOutput.swift
//  CharactersInteractorOutput
//
//  Created by Mangust on 30.04.2022.
//

import Foundation

// sourcery: AutoMockable
protocol CharactersInteractorOutput: AnyObject {
    func updateView(with data: MarvelResults<Character>)
    func show(errorMessage: String, errorTitle: String)
}
