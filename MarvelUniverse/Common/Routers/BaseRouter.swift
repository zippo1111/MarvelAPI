//
//  BaseRouter.swift
//  BaseRouter
//
//  Created by Mangust on 01.05.2022.
//

import UIKit

class BaseRouter: BaseRouterInput {
    weak var sourceViewController: UIViewController?
    var firstNavigationController = UINavigationController()

    required init(viewController: UIViewController) {
        sourceViewController = viewController
    }

    func dismiss(animated: Bool, completion: VoidBlock?) {
        if let navigationController = sourceViewController?.navigationController {
            navigationController.popViewController(animated: animated)
        }

        guard let _ = sourceViewController?.presentingViewController else {
            return
        }

        sourceViewController?.dismiss(animated: animated, completion: completion)
    }

    func show(_ viewController: UIViewController, context: Any?, animated: Bool, completion: VoidBlock?) {
        guard let navigationController = sourceViewController?.navigationController else {
            present(viewController, context: context, animated: animated, completion: completion)
            return
        }

        navigationController.pushViewController(viewController, animated: animated)
    }

    func present(_ viewController: UIViewController, context: Any?, animated: Bool, completion: VoidBlock?) {
        sourceViewController?.present(viewController, animated: animated, completion: completion)
    }
}
