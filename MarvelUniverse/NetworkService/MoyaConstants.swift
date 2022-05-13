//
//  MoyaConstants.swift
//  MoyaConstants
//
//  Created by Mangust on 13.05.2022.
//

import MarvelUniverse
import Moya

enum MoyaConstants {
    static var provider: MoyaProvider<Marvel>!

    static let characterLastName = "Agatha Harkness***"
    static let expectationInitial = "Load initial characters"
    static let expectationMore = "Load more characters"
    static let expectationSearch = "Search characters"
    static let jsonFileName = "characters"
    static let jsonFileExtention = "json"
    static let networkSuccessReponse = 200
    static let limit = 10
    static let offset = 10
    static let expectationTimeout = 5.0
}
