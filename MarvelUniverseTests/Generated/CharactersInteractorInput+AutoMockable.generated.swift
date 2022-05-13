// Generated using Sourcery 1.3.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import MarvelUniverse

class CharactersInteractorInputMock: CharactersInteractorInput {

    //MARK: - loadInitialCharacters

    var loadInitialCharactersCallsCount = 0
    var loadInitialCharactersCalled: Bool {
        return loadInitialCharactersCallsCount > 0
    }
    var loadInitialCharactersClosure: (() -> Void)?

    func loadInitialCharacters() {
        loadInitialCharactersCallsCount += 1
        loadInitialCharactersClosure?()
    }

    //MARK: - getDetailsDataStorage

    var getDetailsDataStorageAtCallsCount = 0
    var getDetailsDataStorageAtCalled: Bool {
        return getDetailsDataStorageAtCallsCount > 0
    }
    var getDetailsDataStorageAtReceivedIndex: Int?
    var getDetailsDataStorageAtReceivedInvocations: [Int] = []
    var getDetailsDataStorageAtReturnValue: CharacterDetailsDataStorage?
    var getDetailsDataStorageAtClosure: ((Int) -> CharacterDetailsDataStorage?)?

    func getDetailsDataStorage(at index: Int) -> CharacterDetailsDataStorage? {
        getDetailsDataStorageAtCallsCount += 1
        getDetailsDataStorageAtReceivedIndex = index
        getDetailsDataStorageAtReceivedInvocations.append(index)
        return getDetailsDataStorageAtClosure.map({ $0(index) }) ?? getDetailsDataStorageAtReturnValue
    }

    //MARK: - loadMore

    var loadMoreCallsCount = 0
    var loadMoreCalled: Bool {
        return loadMoreCallsCount > 0
    }
    var loadMoreClosure: (() -> Void)?

    func loadMore() {
        loadMoreCallsCount += 1
        loadMoreClosure?()
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
