//
//  AlertPresenter.swift
//  AlertPresenter
//
//  Created by Mangust on 13.05.2022.
//

import UIKit

// sourcery: AutoMockable
protocol AlertProtocol {
    func addAction(
        titled title: String,
        style: UIAlertAction.Style,
        handler: AlertHandler?
    )

    func present(
        title: String,
        message: String,
        on controller: UIViewController,
        animated: Bool,
        completion: VoidBlock?
    )

    func handler(for action: UIAlertAction) -> AlertHandler?
}

final class AlertService: AlertProtocol {
    private var actions = [UIAlertAction: AlertHandler]()

    func addAction(
        titled title: String,
        style: UIAlertAction.Style,
        handler: AlertHandler?
    ) {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        actions[action] = handler
    }

    func present(
        title: String,
        message: String,
        on controller: UIViewController,
        animated: Bool,
        completion: VoidBlock?
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        actions.keys.forEach({ alert.addAction($0) })
        controller.present(alert, animated: animated, completion: completion)
    }

    func handler(for action: UIAlertAction) -> AlertHandler? {
        return actions[action]
    }
}
