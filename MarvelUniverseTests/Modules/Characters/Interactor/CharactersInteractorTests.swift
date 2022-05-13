//
//  CharactersInteractorTests.swift
//  CharactersInteractorTests
//
//  Created by Mangust on 10.05.2022.
//

@testable import MarvelUniverse
import XCTest
import Moya

class CharactersInteractorTests: XCTestCase {

    private var interactor: CharactersInteractor!
    private var dataStorage: CharacterDataStorage!
    private var presenterMock: CharactersInteractorOutputMock!
    private var viewController: CharactersTableViewController!
    private var routerMock: CharactersRouterInputMock!

    override func setUp() {
        super.setUp()

        viewController = .init()
        routerMock = .init(viewController: viewController)
        presenterMock = .init()

        dataStorage = .init(
            limit: nil,
            offset: nil,
            characters: [DataStorageMock.character]
        )

        interactor = .init(
            dataStorage: dataStorage,
            output: presenterMock
        )

        MoyaConstants.provider = MoyaProvider<Marvel>(
            endpointClosure: customEndpointClosure,
            stubClosure: MoyaProvider.immediatelyStub
        )
    }

    override func tearDown() {
        super.tearDown()

        interactor = nil
        presenterMock = nil
        viewController = nil
        routerMock = nil
        dataStorage = nil
    }

    // MARK: Moya setup

    func customEndpointClosure(_ target: Marvel) -> Endpoint {
        Endpoint(
            url: URL(target: target).absoluteString,
            sampleResponseClosure: {
                .networkResponse(
                    MoyaConstants.networkSuccessReponse,
                    target.testSampleData
                )
            },
            method: target.method,
            task: target.task,
            httpHeaderFields: target.headers
        )
    }

    // MARK: CharactersInteractorInput

    func testLoadInitialCharacters() {
        // when
        interactor.loadInitialCharacters()

        // then
        let expectation = self.expectation(description: MoyaConstants.expectationInitial)

        _ = MoyaConstants
            .provider?
            .request(.characters(MoyaConstants.limit, MoyaConstants.offset, nil)) { [weak self] result in
            expectation.fulfill()

            self?.response(with: result)
        }

        waitForExpectations(timeout: MoyaConstants.expectationTimeout, handler: nil)
    }

    func testGetDetailsDataStorage() {
        // when
        interactor.loadInitialCharacters()
        let expectation = self.expectation(description: MoyaConstants.expectationInitial)

        // then
        _ = MoyaConstants
            .provider?
            .request(.characters(MoyaConstants.limit, MoyaConstants.offset, nil)) { result in
            expectation.fulfill()

            switch result {
            case .success(let response):
                let characters = try! response.map(MarvelResponse<Character>.self).data.results
                let character = characters.first

                let dataStorage = CharacterDetailsDataStorage(
                    name: DataStorageMock.character.name,
                    description: DataStorageMock.character.description,
                    photoUrl: DataStorageMock.character.thumbnail.url
                )
                XCTAssertEqual(character?.name, dataStorage.name)
            case .failure(_):
                XCTAssertFalse(true)
            }
        }

        waitForExpectations(timeout: MoyaConstants.expectationTimeout, handler: nil)
    }

    func testLoadMore() {
        // when
        interactor.loadMore()

        // then
        let expectation = self.expectation(description: MoyaConstants.expectationMore)

        _ = MoyaConstants
            .provider?
            .request(.characters(MoyaConstants.limit, MoyaConstants.offset, nil)) { [weak self] result in
            expectation.fulfill()

            self?.response(with: result)
        }

        waitForExpectations(timeout: MoyaConstants.expectationTimeout, handler: nil)
    }

    func testSearch() {
        // given
        let name = ""

        // when
        interactor.loadMore()

        // then
        let expectation = self.expectation(description: MoyaConstants.expectationSearch)

        _ = MoyaConstants
            .provider?
            .request(.characters(nil, nil, name)) { [weak self] result in
            expectation.fulfill()

            self?.response(with: result)
        }

        waitForExpectations(timeout: MoyaConstants.expectationTimeout, handler: nil)
    }

    private func response(with result: Result<Moya.Response, MoyaError>) {
        switch result {
        case .success(let response):
            let data = try! response.map(MarvelResponse<Character>.self).data

            XCTAssertNotNil(data)
            XCTAssertEqual(data.results.last?.name, MoyaConstants.characterLastName)
        case .failure(_):
            XCTAssertTrue(false)
        }
    }
}

extension Marvel {
    var testSampleData: Data {
        switch self {
        case .characters(_, _, _):
            let url = Bundle(for: CharactersInteractorTests.self).url(
                forResource: MoyaConstants.jsonFileName,
                withExtension: MoyaConstants.jsonFileExtention
            )!
            return try! Data(contentsOf: url)
        }
    }
}
