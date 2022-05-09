//
//  CharacterViewModel.swift
//  CharacterViewModel
//
//  Created by Mangust on 01.05.2022.
//

import Foundation

struct CharacterViewModel {
    let title: String
    let imageUrl: URL?
}

struct CharacterDataViewModel {
    let total: Int
    let count: Int
    let characterViewModels: [CharacterViewModel]
}
