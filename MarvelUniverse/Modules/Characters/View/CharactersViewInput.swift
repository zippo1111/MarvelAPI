//
//  CharactersViewInput.swift
//  CharactersViewInput
//
//  Created by Mangust on 01.05.2022.
//

protocol CharactersViewInput: AnyObject {
    func configureView(viewModels: CharacterDataViewModel)
    func showAlert(message: String, title: String)
}
