//
//  CharactersConfiguratorTests.swift
//  CharactersConfiguratorTests
//
//  Created by Mangust on 10.05.2022.
//

@testable import MarvelUniverse
import XCTest

class CharactersConfiguratorTests: XCTestCase {

    func testConfigureModuleForViewController() {
        // given
        let viewController = CharactersTableViewController()
        let configurator = CharactersConfigurator()
        let dataStorage = CharacterDataStorage(
            limit: nil,
            offset: nil,
            characters: [DataStorageMock.character]
        )

        // when
        configurator.configureModule(viewInput: viewController, dataStorage: dataStorage)

        let presenter: CharactersPresenter = viewController.output as! CharactersPresenter
        let interactor: CharactersInteractor = presenter.interactor as! CharactersInteractor

        // then
        XCTAssertNotNil(viewController.output, "CharactersTableViewController is nil after configuration")
        XCTAssertTrue(viewController.output is CharactersPresenter, "output is not CharactersPresenter")

        XCTAssertNotNil(presenter.output, "output in CharactersPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in CharactersPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is CharactersRouter, "router is not CharactersRouter")

        XCTAssertNotNil(interactor.output, "output in CharactersInteractor is nil after configuration")
        XCTAssertNotNil(interactor.dataStorage, "dataStorage in CharactersInteractor is nil after configuration")
    }
    
}
