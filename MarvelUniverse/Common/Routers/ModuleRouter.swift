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

    func setRootModule(_ module: UIViewController?, animated: Bool, hideBar: Bool, hideStatusBar: Bool) {
        guard let module = module else {
            return
        }

        rootController?.setViewControllers([module], animated: animated)
        rootController?.setNavigationBarHidden(hideBar, animated: false)

        module
        rootController?.setNeedsStatusBarAppearanceUpdate()
    }

    func dismiss(animated: Bool, completion: VoidBlock?) {
        rootController?.dismiss(animated: animated, completion: completion)
    }
}
