// Generated using Sourcery 1.3.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import MarvelUniverse

class CharacterDetailsPresenterServiceProtocolMock: CharacterDetailsPresenterServiceProtocol {

    //MARK: - getViewModel

    var getViewModelDataStorageCallsCount = 0
    var getViewModelDataStorageCalled: Bool {
        return getViewModelDataStorageCallsCount > 0
    }
    var getViewModelDataStorageReceivedDataStorage: CharacterDetailsDataStorage?
    var getViewModelDataStorageReceivedInvocations: [CharacterDetailsDataStorage] = []
    var getViewModelDataStorageReturnValue: CharacterDetailsViewModel?
    var getViewModelDataStorageClosure: ((CharacterDetailsDataStorage) -> CharacterDetailsViewModel?)?

    func getViewModel(dataStorage: CharacterDetailsDataStorage) -> CharacterDetailsViewModel? {
        getViewModelDataStorageCallsCount += 1
        getViewModelDataStorageReceivedDataStorage = dataStorage
        getViewModelDataStorageReceivedInvocations.append(dataStorage)
        return getViewModelDataStorageClosure.map({ $0(dataStorage) }) ?? getViewModelDataStorageReturnValue
    }

}
