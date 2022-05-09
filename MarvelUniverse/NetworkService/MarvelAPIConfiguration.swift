//
//  MarvelAPIConfiguration.swift
//  MarvelAPIConfiguration
//
//  Created by Mangust on 03.05.2022.
//

import Foundation
import Moya

// MARK: - CodableResponses

public struct MarvelResponse<T: Codable>: Codable {
    public let data: MarvelResults<T>
}

public struct MarvelResults<T: Codable>: Codable {
    public var results: [T]
    public let total: Int
    public let count: Int
}

let configuration: NetworkLoggerPlugin.Configuration = .init(
    formatter: .init(responseData: JSONResponseDataFormatter),
    logOptions: .verbose
)

private func JSONResponseDataFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}
