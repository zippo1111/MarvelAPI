//
//  BaseRouterInput.swift
//  BaseRouterInput
//
//  Created by Mangust on 01.05.2022.
//

import UIKit

protocol BaseRouterInput: AnyObject {

    var sourceViewController: UIViewController? { get }

    init(viewController: UIViewController)

    func dismiss(animated: Bool, completion: VoidBlock?)

    func show(_ viewController: UIViewController, context: Any?, animated: Bool, completion: VoidBlock?)

    func present(_ viewController: UIViewController, context: Any?, animated: Bool, completion: VoidBlock?)

}

extension BaseRouterInput {
    func dismiss(animated: Bool, completion: VoidBlock?) {
        dismiss(animated: animated, completion: completion)
    }

    func show(_ viewController: UIViewController, context: Any?, animated: Bool, completion: VoidBlock?) {
        show(viewController, context: context, animated: animated, completion: completion)
    }

    func present(_ viewController: UIViewController, context: Any?, animated: Bool, completion: VoidBlock?) {
        present(viewController, context: context, animated: animated, completion: completion)
    }
}
