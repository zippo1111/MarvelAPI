//
//  CharacterDetailsInteractorOutput.swift
//  CharacterDetailsInteractorOutput
//
//  Created by Mangust on 05.05.2022.
//

import Foundation

protocol CharacterDetailsInteractorOutput: AnyObject {
    func loadView(with dataStorage: CharacterDetailsDataStorage)
}
