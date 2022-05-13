//
//  CharacterViewModel.swift
//  CharacterViewModel
//
//  Created by Mangust on 01.05.2022.
//

import Foundation

struct CharacterViewModel: Equatable {
    let title: String
    let imageUrl: URL?
}

struct CharacterDataViewModel: Equatable {
    let total: Int
    let count: Int
    let characterViewModels: [CharacterViewModel]

    static func == (lhs: CharacterDataViewModel, rhs: CharacterDataViewModel) -> Bool {
        lhs.total == rhs.total &&
        lhs.count == rhs.count &&
        lhs.characterViewModels == rhs.characterViewModels
    }
}
