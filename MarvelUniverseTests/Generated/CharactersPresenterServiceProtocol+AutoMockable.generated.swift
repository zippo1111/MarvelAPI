// Generated using Sourcery 1.3.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import MarvelUniverse

class CharactersPresenterServiceProtocolMock: CharactersPresenterServiceProtocol {

    //MARK: - getViewModel

    var getViewModelDataCallsCount = 0
    var getViewModelDataCalled: Bool {
        return getViewModelDataCallsCount > 0
    }
    var getViewModelDataReceivedData: MarvelResults<Character>?
    var getViewModelDataReceivedInvocations: [MarvelResults<Character>] = []
    var getViewModelDataReturnValue: CharacterDataViewModel!
    var getViewModelDataClosure: ((MarvelResults<Character>) -> CharacterDataViewModel)?

    func getViewModel(data: MarvelResults<Character>) -> CharacterDataViewModel {
        getViewModelDataCallsCount += 1
        getViewModelDataReceivedData = data
        getViewModelDataReceivedInvocations.append(data)
        return getViewModelDataClosure.map({ $0(data) }) ?? getViewModelDataReturnValue
    }

}
