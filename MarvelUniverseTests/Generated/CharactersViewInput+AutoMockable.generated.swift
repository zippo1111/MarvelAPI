// Generated using Sourcery 1.3.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import MarvelUniverse

class CharactersViewInputMock: CharactersViewInput {

    //MARK: - configureView

    var configureViewViewModelsCallsCount = 0
    var configureViewViewModelsCalled: Bool {
        return configureViewViewModelsCallsCount > 0
    }
    var configureViewViewModelsReceivedViewModels: CharacterDataViewModel?
    var configureViewViewModelsReceivedInvocations: [CharacterDataViewModel] = []
    var configureViewViewModelsClosure: ((CharacterDataViewModel) -> Void)?

    func configureView(viewModels: CharacterDataViewModel) {
        configureViewViewModelsCallsCount += 1
        configureViewViewModelsReceivedViewModels = viewModels
        configureViewViewModelsReceivedInvocations.append(viewModels)
        configureViewViewModelsClosure?(viewModels)
    }

    //MARK: - showAlert

    var showAlertMessageTitleCallsCount = 0
    var showAlertMessageTitleCalled: Bool {
        return showAlertMessageTitleCallsCount > 0
    }
    var showAlertMessageTitleReceivedArguments: (alertService: AlertProtocol, message: String, title: String)?
    var showAlertMessageTitleReceivedInvocations: [(alertService: AlertProtocol, message: String, title: String)] = []
    var showAlertMessageTitleClosure: ((AlertProtocol, String, String) -> Void)?

    func showAlert(_ alertService: AlertProtocol, message: String, title: String) {
        showAlertMessageTitleCallsCount += 1
        showAlertMessageTitleReceivedArguments = (alertService: alertService, message: message, title: title)
        showAlertMessageTitleReceivedInvocations.append((alertService: alertService, message: message, title: title))
        showAlertMessageTitleClosure?(alertService, message, title)
    }

}
