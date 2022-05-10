//
//  CharactersCoordinator.swift
//  CharactersCoordinator
//
//  Created by Mangust on 01.05.2022.
//

import UIKit

final class CharactersCoordinator: BaseCoordinator {
    private let navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    override func start() {
        guard let navigationController = navigationController else {
            return
        }

        let router = ModuleRouter(rootController: navigationController)
        let module = CharactersWireframe().initCharactersViewController()
        module.isStatusBarHidden = true

        router.setRootModule(module, animated: false, hideBar: true, hideStatusBar: true)
    }
}
