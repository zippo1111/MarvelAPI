//
//  CharacterDetailsViewModel.swift
//  CharacterDetailsViewModel
//
//  Created by Mangust on 05.05.2022.
//

import Foundation

struct CharacterDetailsViewModel {
    let name: String
    let imageUrl: URL?
    let description: String?

    enum TableHeaders: String {
        case name = "Name"
        case description = "Description"
    }
}
