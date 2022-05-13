//
//  CharactersViewOutput.swift
//  CharactersViewOutput
//
//  Created by Mangust on 01.05.2022.
//

//sourcery: AutoMockable
protocol CharactersViewOutput {
    func viewIsReady()
    func didTapCell(at index: Int)
    func didScrollToEnd()
    func search(name startWith: String)
}
