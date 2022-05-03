//
//  ModuleRouter.swift
//  ModuleRouter
//
//  Created by Mangust on 02.05.2022.
//

import UIKit

final class ModuleRouter: ModuleRouterInput {
    private weak var rootController: UINavigationController?

    init(rootController: UINavigationController) {
        self.rootController = rootController
    }

    func setRootModule(_ module: UIViewController?, animated: Bool, hideBar: Bool) {
        guard let module = module else {
            return
        }

        rootController?.setViewControllers([module], animated: animated)
        rootController?.isNavigationBarHidden = hideBar
    }

    func dismiss(animated: Bool, completion: VoidBlock?) {
        rootController?.dismiss(animated: animated, completion: completion)
    }
}
