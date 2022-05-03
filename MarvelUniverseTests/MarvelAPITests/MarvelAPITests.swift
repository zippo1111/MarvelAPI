//
//  MarvelAPITests.swift
//  MarvelAPITests
//
//  Created by Mangust on 03.05.2022.
//

import XCTest
import MarvelUniverse
import Moya

class MarvelAPITests: XCTestCase {

    var provider: MoyaProvider<Marvel>!

    enum Constants {
        static let characterLastName = "Agatha Harkness***"
        static let expectationDescription = "Testing MarvelAPI request"
        static let jsonFileName = "characters"
        static let jsonFileExtention = "json"
        static let networkSuccessReponse = 200
        static let limit = 10
        static let offset = 10
        static let expectationTimeout = 5.0
    }

    override func setUp() {
        super.setUp()

        provider = MoyaProvider<Marvel>(
            endpointClosure: customEndpointClosure,
            stubClosure: MoyaProvider.immediatelyStub
        )
    }

    func customEndpointClosure(_ target: Marvel) -> Endpoint {
        Endpoint(
            url: URL(target: target).absoluteString,
            sampleResponseClosure: {
                .networkResponse(
                    Constants.networkSuccessReponse,
                    target.testSampleData
                )
            },
            method: target.method,
            task: target.task,
            httpHeaderFields: target.headers
        )
    }

    func testMarvelAPIResponse() {
        let expectation = self.expectation(description: Constants.expectationDescription)
        _ = provider?.request(
            .characters(Constants.limit, Constants.offset)
        ) { result in
            expectation.fulfill()

            switch result {
            case .success(let response):
                XCTAssertNotNil(response.data)

                let characters = try! response.map(MarvelResponse<Character>.self).data.results

                XCTAssertEqual(characters.last?.name, Constants.characterLastName)
            case .failure(_):
                XCTAssertTrue(false)
            }
        }
        self.waitForExpectations(timeout: Constants.expectationTimeout, handler: nil)
    }
}

extension Marvel {
    var testSampleData: Data {
        switch self {
        case .characters(_, _):
            let url = Bundle(for: MarvelAPITests.self).url(
                forResource: MarvelAPITests.Constants.jsonFileName,
                withExtension: MarvelAPITests.Constants.jsonFileExtention
            )!
            return try! Data(contentsOf: url)
        }
    }
}
