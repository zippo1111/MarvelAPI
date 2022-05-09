//
//  CharacterDetailsInteractor.swift
//  CharacterDetailsInteractor
//
//  Created by Mangust on 05.05.2022.
//

import Foundation

final class CharacterDetailsInteractor {
    private(set) var dataStorage: CharacterDetailsDataStorage
    private(set) weak var output: CharacterDetailsInteractorOutput!

    init(dataStorage: CharacterDetailsDataStorage, output: CharacterDetailsInteractorOutput) {
        self.dataStorage = dataStorage
        self.output = output
    }
}

extension CharacterDetailsInteractor: CharacterDetailsInteractorInput {
    func getDetails() {
        output.loadView(with: dataStorage)
    }
}
