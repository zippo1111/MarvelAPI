// Generated using Sourcery 1.3.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import MarvelUniverse

class AlertProtocolMock: AlertProtocol {

    //MARK: - addAction

    var addActionTitledStyleHandlerCallsCount = 0
    var addActionTitledStyleHandlerCalled: Bool {
        return addActionTitledStyleHandlerCallsCount > 0
    }
    var addActionTitledStyleHandlerReceivedArguments: (title: String, style: UIAlertAction.Style, handler: AlertHandler?)?
    var addActionTitledStyleHandlerReceivedInvocations: [(title: String, style: UIAlertAction.Style, handler: AlertHandler?)] = []
    var addActionTitledStyleHandlerClosure: ((String, UIAlertAction.Style, AlertHandler?) -> Void)?

    func addAction(titled title: String, style: UIAlertAction.Style, handler: AlertHandler?) {
        addActionTitledStyleHandlerCallsCount += 1
        addActionTitledStyleHandlerReceivedArguments = (title: title, style: style, handler: handler)
        addActionTitledStyleHandlerReceivedInvocations.append((title: title, style: style, handler: handler))
        addActionTitledStyleHandlerClosure?(title, style, handler)
    }

    //MARK: - present

    var presentTitleMessageOnAnimatedCompletionCallsCount = 0
    var presentTitleMessageOnAnimatedCompletionCalled: Bool {
        return presentTitleMessageOnAnimatedCompletionCallsCount > 0
    }
    var presentTitleMessageOnAnimatedCompletionReceivedArguments: (title: String, message: String, controller: UIViewController, animated: Bool, completion: VoidBlock?)?
    var presentTitleMessageOnAnimatedCompletionReceivedInvocations: [(title: String, message: String, controller: UIViewController, animated: Bool, completion: VoidBlock?)] = []
    var presentTitleMessageOnAnimatedCompletionClosure: ((String, String, UIViewController, Bool, VoidBlock?) -> Void)?

    func present(title: String, message: String, on controller: UIViewController, animated: Bool, completion: VoidBlock?) {
        presentTitleMessageOnAnimatedCompletionCallsCount += 1
        presentTitleMessageOnAnimatedCompletionReceivedArguments = (title: title, message: message, controller: controller, animated: animated, completion: completion)
        presentTitleMessageOnAnimatedCompletionReceivedInvocations.append((title: title, message: message, controller: controller, animated: animated, completion: completion))
        presentTitleMessageOnAnimatedCompletionClosure?(title, message, controller, animated, completion)
    }

    //MARK: - handler

    var handlerForCallsCount = 0
    var handlerForCalled: Bool {
        return handlerForCallsCount > 0
    }
    var handlerForReceivedAction: UIAlertAction?
    var handlerForReceivedInvocations: [UIAlertAction] = []
    var handlerForReturnValue: AlertHandler?
    var handlerForClosure: ((UIAlertAction) -> AlertHandler?)?

    func handler(for action: UIAlertAction) -> AlertHandler? {
        handlerForCallsCount += 1
        handlerForReceivedAction = action
        handlerForReceivedInvocations.append(action)
        return handlerForClosure.map({ $0(action) }) ?? handlerForReturnValue
    }

}
