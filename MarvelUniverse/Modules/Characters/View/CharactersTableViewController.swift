//
//  CharactersTableViewController.swift
//  MarvelUniverse
//
//  Created by Mangust on 29.04.2022.
//

import UIKit

class CharactersTableViewController: UITableViewController {

    var output: CharactersViewOutput?

    init() {
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.viewIsReady()
    }
}

extension CharactersTableViewController: CharactersViewInput {
    func configureView(_ viewModel: CharacterViewModel) {

    }
}
