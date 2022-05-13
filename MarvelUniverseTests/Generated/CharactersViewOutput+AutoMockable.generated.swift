// Generated using Sourcery 1.3.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import MarvelUniverse

class CharactersViewOutputMock: CharactersViewOutput {

    //MARK: - viewIsReady

    var viewIsReadyCallsCount = 0
    var viewIsReadyCalled: Bool {
        return viewIsReadyCallsCount > 0
    }
    var viewIsReadyClosure: (() -> Void)?

    func viewIsReady() {
        viewIsReadyCallsCount += 1
        viewIsReadyClosure?()
    }

    //MARK: - didTapCell

    var didTapCellAtCallsCount = 0
    var didTapCellAtCalled: Bool {
        return didTapCellAtCallsCount > 0
    }
    var didTapCellAtReceivedIndex: Int?
    var didTapCellAtReceivedInvocations: [Int] = []
    var didTapCellAtClosure: ((Int) -> Void)?

    func didTapCell(at index: Int) {
        didTapCellAtCallsCount += 1
        didTapCellAtReceivedIndex = index
        didTapCellAtReceivedInvocations.append(index)
        didTapCellAtClosure?(index)
    }

    //MARK: - didScrollToEnd

    var didScrollToEndCallsCount = 0
    var didScrollToEndCalled: Bool {
        return didScrollToEndCallsCount > 0
    }
    var didScrollToEndClosure: (() -> Void)?

    func didScrollToEnd() {
        didScrollToEndCallsCount += 1
        didScrollToEndClosure?()
    }

    //MARK: - search

    var searchNameCallsCount = 0
    var searchNameCalled: Bool {
        return searchNameCallsCount > 0
    }
    var searchNameReceivedStartWith: String?
    var searchNameReceivedInvocations: [String] = []
    var searchNameClosure: ((String) -> Void)?

    func search(name startWith: String) {
        searchNameCallsCount += 1
        searchNameReceivedStartWith = startWith
        searchNameReceivedInvocations.append(startWith)
        searchNameClosure?(startWith)
    }

}
