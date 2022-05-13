//
//  SearchController.swift
//  SearchController
//
//  Created by Mangust on 10.05.2022.
//

import UIKit

final class SearchController: UISearchController {
    var isStatusBarHidden = true

    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var prefersStatusBarHidden: Bool {
        isStatusBarHidden
    }
}
