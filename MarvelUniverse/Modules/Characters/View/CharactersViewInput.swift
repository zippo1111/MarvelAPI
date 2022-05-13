//
//  CharactersViewInput.swift
//  CharactersViewInput
//
//  Created by Mangust on 01.05.2022.
//

// sourcery: AutoMockable
protocol CharactersViewInput: AnyObject {
    func configureView(viewModels: CharacterDataViewModel)
    func showAlert(_ alertService: AlertProtocol, message: String, title: String)
}
