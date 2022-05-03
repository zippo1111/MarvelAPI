//
//  PlistFields.swift
//  PlistFields
//
//  Created by Mangust on 02.05.2022.
//

import Foundation

enum PlistFields {
    static let publicKey = Bundle.main.object(forInfoDictionaryKey: "Marvel_public_key")
    static let privateKey = Bundle.main.object(forInfoDictionaryKey: "Marvel_private_key")
}
