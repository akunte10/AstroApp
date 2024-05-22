//
//  NasaDataModel.swift
//  AstroApp
//
//  Created by Ajay Kunte on 22/05/24.
//

import Foundation

// MARK: - NasaDataModel
struct NasaDataModelElement: Codable {
    let date, explanation: String?
    let hdurl: String?
    let mediaType, serviceVersion, title: String?
    let url: String?
    let copyright: String?

    enum CodingKeys: String, CodingKey {
        case date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url, copyright
    }
}

typealias NasaDataModel = [NasaDataModelElement]
