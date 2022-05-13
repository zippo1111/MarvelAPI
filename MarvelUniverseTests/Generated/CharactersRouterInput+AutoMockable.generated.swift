// Generated using Sourcery 1.3.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import MarvelUniverse

class CharactersRouterInputMock: CharactersRouterInput {
    var sourceViewController: UIViewController?

    //MARK: - goToDetails

    var goToDetailsCallsCount = 0
    var goToDetailsCalled: Bool {
        return goToDetailsCallsCount > 0
    }
    var goToDetailsReceivedDataStorage: CharacterDetailsDataStorage?
    var goToDetailsReceivedInvocations: [CharacterDetailsDataStorage] = []
    var goToDetailsClosure: ((CharacterDetailsDataStorage) -> Void)?

    func goToDetails(_ dataStorage: CharacterDetailsDataStorage) {
        goToDetailsCallsCount += 1
        goToDetailsReceivedDataStorage = dataStorage
        goToDetailsReceivedInvocations.append(dataStorage)
        goToDetailsClosure?(dataStorage)
    }

    //MARK: - init

    var initViewControllerReceivedViewController: UIViewController?
    var initViewControllerReceivedInvocations: [UIViewController] = []
    var initViewControllerClosure: ((UIViewController) -> Void)?

    required init(viewController: UIViewController) {
        initViewControllerReceivedViewController = viewController
        initViewControllerReceivedInvocations.append(viewController)
        initViewControllerClosure?(viewController)
    }
    //MARK: - dismiss

    var dismissAnimatedCompletionCallsCount = 0
    var dismissAnimatedCompletionCalled: Bool {
        return dismissAnimatedCompletionCallsCount > 0
    }
    var dismissAnimatedCompletionReceivedArguments: (animated: Bool, completion: VoidBlock?)?
    var dismissAnimatedCompletionReceivedInvocations: [(animated: Bool, completion: VoidBlock?)] = []
    var dismissAnimatedCompletionClosure: ((Bool, VoidBlock?) -> Void)?

    func dismiss(animated: Bool, completion: VoidBlock?) {
        dismissAnimatedCompletionCallsCount += 1
        dismissAnimatedCompletionReceivedArguments = (animated: animated, completion: completion)
        dismissAnimatedCompletionReceivedInvocations.append((animated: animated, completion: completion))
        dismissAnimatedCompletionClosure?(animated, completion)
    }

    //MARK: - show

    var showContextAnimatedCompletionCallsCount = 0
    var showContextAnimatedCompletionCalled: Bool {
        return showContextAnimatedCompletionCallsCount > 0
    }
    var showContextAnimatedCompletionReceivedArguments: (viewController: UIViewController, context: Any?, animated: Bool, completion: VoidBlock?)?
    var showContextAnimatedCompletionReceivedInvocations: [(viewController: UIViewController, context: Any?, animated: Bool, completion: VoidBlock?)] = []
    var showContextAnimatedCompletionClosure: ((UIViewController, Any?, Bool, VoidBlock?) -> Void)?

    func show(_ viewController: UIViewController, context: Any?, animated: Bool, completion: VoidBlock?) {
        showContextAnimatedCompletionCallsCount += 1
        showContextAnimatedCompletionReceivedArguments = (viewController: viewController, context: context, animated: animated, completion: completion)
        showContextAnimatedCompletionReceivedInvocations.append((viewController: viewController, context: context, animated: animated, completion: completion))
        showContextAnimatedCompletionClosure?(viewController, context, animated, completion)
    }

    //MARK: - present

    var presentContextAnimatedCompletionCallsCount = 0
    var presentContextAnimatedCompletionCalled: Bool {
        return presentContextAnimatedCompletionCallsCount > 0
    }
    var presentContextAnimatedCompletionReceivedArguments: (viewController: UIViewController, context: Any?, animated: Bool, completion: VoidBlock?)?
    var presentContextAnimatedCompletionReceivedInvocations: [(viewController: UIViewController, context: Any?, animated: Bool, completion: VoidBlock?)] = []
    var presentContextAnimatedCompletionClosure: ((UIViewController, Any?, Bool, VoidBlock?) -> Void)?

    func present(_ viewController: UIViewController, context: Any?, animated: Bool, completion: VoidBlock?) {
        presentContextAnimatedCompletionCallsCount += 1
        presentContextAnimatedCompletionReceivedArguments = (viewController: viewController, context: context, animated: animated, completion: completion)
        presentContextAnimatedCompletionReceivedInvocations.append((viewController: viewController, context: context, animated: animated, completion: completion))
        presentContextAnimatedCompletionClosure?(viewController, context, animated, completion)
    }

}
