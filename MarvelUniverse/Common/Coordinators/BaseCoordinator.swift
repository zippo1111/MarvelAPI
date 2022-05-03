//
//  BaseCoordinator.swift
//  BaseCoordinator
//
//  Created by Mangust on 01.05.2022.
//

class BaseCoordinator: CoordinatorProtocol {

    var childCoordinators: [CoordinatorProtocol] = []

    func start() {}

    func addDependency(_ coordinator: CoordinatorProtocol) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }

        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: CoordinatorProtocol?) {
        guard let coordinator = coordinator as? BaseCoordinator,
              !childCoordinators.isEmpty else {
            return
        }

        if !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter({ $0 !== coordinator })
                .forEach({ coordinator.removeDependency($0) })
        }

        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
