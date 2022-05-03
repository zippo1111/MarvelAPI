//
//  ApplicationCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Mangust on 01.05.2022.
//

import UIKit

final class ApplicationCoordinator: BaseCoordinator {

    private let navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    override func start() {
        let coordinator = CharactersCoordinator(navigationController: navigationController)
        coordinator.start()
        addDependency(coordinator)
    }
}
