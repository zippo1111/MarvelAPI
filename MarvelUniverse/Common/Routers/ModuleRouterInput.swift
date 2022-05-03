//
//  ModuleRouterInput.swift
//  ModuleRouterInput
//
//  Created by Mangust on 02.05.2022.
//

import UIKit

protocol ModuleRouterInput {
    func setRootModule(_ module: UIViewController?, animated: Bool, hideBar: Bool)
    func dismiss(animated: Bool, completion: VoidBlock?)
}
