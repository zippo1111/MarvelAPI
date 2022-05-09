//
//  MarvelAPI.swift
//  MarvelAPI
//
//  Created by Mangust on 02.05.2022.
//

import Foundation
import Moya
import CryptoKit

public enum Marvel {
    case characters(Int?, Int?)
}

// MARK: - Provider configuration

let marvelProvider = MoyaProvider<Marvel>(
    plugins: [NetworkLoggerPlugin(configuration: configuration)]
)

// MARK: - Constants

private enum Constants {
    static let host = "http://gateway.marvel.com"
    static let charactersPath = "/v1/public/characters"
    static let jsonHeader = ["Content-Type": "application/json"]
    static let orderBy = "name"
    static let limitKey = "limit"
    static let offsetKey = "offset"
}

// MARK: - Extensions

extension Marvel: TargetType {
    public var baseURL: URL {
        URL(string: Constants.host)!
    }

    public var path: String {
        switch self {
        case .characters:
            return Constants.charactersPath
        }
    }

    public var method: Moya.Method { .get }

    public var task: Task {
//        guard let privateKey = PlistFields.privateKey,
//              let publicKey = PlistFields.publicKey
//        else {
//            return .requestPlain
//        }

        let ts = "\(Date().timeIntervalSince1970)"
        let privateKey = "1098df006e7e6edce50211c7be6431daabee3d73"
        let publicKey = "5d94fab0240e515bd064e7d9362f8e78"
        let hashString = ts+"\(privateKey)"+"\(publicKey)"
        let hash = hashString.md5

        switch self {
        case .characters(let limit, let offset):
            var parameters: [String: String] = [
                "orderBy": Constants.orderBy,
                "ts": ts,
                "apikey": "\(publicKey)",
                "hash": hash
            ]

            if let limit = limit {
                parameters.updateValue(
                    "\(limit)",
                    forKey: Constants.limitKey
                )
            }
            if let offset = offset {
                parameters.updateValue(
                    "\(offset)",
                    forKey: Constants.offsetKey
                )
            }

            return .requestParameters(
                parameters: parameters,
                encoding: URLEncoding.default
            )
        }
    }

    public var validationType: ValidationType { .successCodes }

    public var headers: [String: String]? {
        Constants.jsonHeader
    }

    public var sampleData: Data {
        Data()
    }
}

private extension String {
    var md5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
