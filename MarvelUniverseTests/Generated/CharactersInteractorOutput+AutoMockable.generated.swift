// Generated using Sourcery 1.3.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import MarvelUniverse

class CharactersInteractorOutputMock: CharactersInteractorOutput {

    //MARK: - updateView

    var updateViewWithCallsCount = 0
    var updateViewWithCalled: Bool {
        return updateViewWithCallsCount > 0
    }
    var updateViewWithReceivedData: MarvelResults<Character>?
    var updateViewWithReceivedInvocations: [MarvelResults<Character>] = []
    var updateViewWithClosure: ((MarvelResults<Character>) -> Void)?

    func updateView(with data: MarvelResults<Character>) {
        updateViewWithCallsCount += 1
        updateViewWithReceivedData = data
        updateViewWithReceivedInvocations.append(data)
        updateViewWithClosure?(data)
    }

    //MARK: - show

    var showErrorMessageErrorTitleCallsCount = 0
    var showErrorMessageErrorTitleCalled: Bool {
        return showErrorMessageErrorTitleCallsCount > 0
    }
    var showErrorMessageErrorTitleReceivedArguments: (errorMessage: String, errorTitle: String)?
    var showErrorMessageErrorTitleReceivedInvocations: [(errorMessage: String, errorTitle: String)] = []
    var showErrorMessageErrorTitleClosure: ((String, String) -> Void)?

    func show(errorMessage: String, errorTitle: String) {
        showErrorMessageErrorTitleCallsCount += 1
        showErrorMessageErrorTitleReceivedArguments = (errorMessage: errorMessage, errorTitle: errorTitle)
        showErrorMessageErrorTitleReceivedInvocations.append((errorMessage: errorMessage, errorTitle: errorTitle))
        showErrorMessageErrorTitleClosure?(errorMessage, errorTitle)
    }

}
