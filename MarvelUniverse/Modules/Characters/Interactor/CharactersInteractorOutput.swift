//
//  CharactersInteractorOutput.swift
//  CharactersInteractorOutput
//
//  Created by Mangust on 30.04.2022.
//

import Foundation

protocol CharactersInteractorOutput: AnyObject {
    func load(data: MarvelResults<Character>)
    func show(errorMessage: String, errorTitle: String)
}
