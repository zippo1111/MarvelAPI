//
//  CharactersPresenterTests.swift
//  CharactersPresenterTests
//
//  Created by Mangust on 12.05.2022.
//

@testable import MarvelUniverse
import XCTest

class CharactersPresenterTests: XCTestCase {

    private var presenter: CharactersPresenter!
    private var viewController: CharactersTableViewController!
    private var interactor: CharactersInteractorInputMock!
    private var routerMock: CharactersRouterInputMock!
    private var alertService: AlertProtocolMock!
    private var viewModelService: CharactersPresenterServiceProtocol!

    override func setUp() {
        super.setUp()

        alertService = .init()
        viewModelService = CharactersPresenterService()

        viewController = .init()
        routerMock = .init(viewController: viewController)
        presenter = .init(
            alertService: alertService,
            viewModelService: viewModelService
        )
        presenter.output = viewController
        presenter.router = routerMock

        interactor = .init()

        presenter.interactor = interactor
    }

    override func tearDown() {
        super.tearDown()

        interactor = nil
        presenter = nil
        viewController = nil
        routerMock = nil

        alertService = nil
        viewModelService = nil
    }

    // MARK: CharactersViewOutput

    func testViewIsReady() {
        // when
        presenter.viewIsReady()

        // then
        XCTAssertTrue(interactor.loadInitialCharactersCalled)
    }

    func testDidTapCell(at index: Int) {
        // when
        presenter.didTapCell(at: index)

        // then
        XCTAssertTrue(interactor.getDetailsDataStorageAtCalled)
        XCTAssertTrue(routerMock.goToDetailsCalled)
    }

    func testDidScrollToEnd() {
        // when
        presenter.didScrollToEnd()

        // then
        XCTAssertTrue(interactor.loadMoreCalled)
    }

    func testSearch(name startWith: String) {
        // when
        presenter.search(name: startWith)

        // then
        XCTAssertTrue(interactor.searchNameCalled)
    }

    // MARK: CharactersInteractorOutput

    func testUpdateView() {
        // given
        let data = MarvelResults(
            results: [DataStorageMock.character],
            total: 100,
            count: 100
        )
        let viewModels = CharacterDataViewModel(
            total: 100,
            count: 100,
            characterViewModels: [
                CharacterViewModel(
                    title: DataStorageMock.character.name,
                    imageUrl: DataStorageMock.character.thumbnail.url
                )
            ]
        )

        // when
        presenter.updateView(with: data)

        // then
        XCTAssertEqual(viewModelService.getViewModel(data: data), viewModels)
    }

    func testShowAlert() {
        // given
        let message = "Some message"
        let title = "Some title"

        // when
        alertService.present(title: title, message: message, on: viewController, animated: false, completion: nil)

        // then
        XCTAssertTrue(alertService.presentTitleMessageOnAnimatedCompletionCalled)
    }

}
