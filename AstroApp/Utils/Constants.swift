//
//  Constants.swift
//  AstroApp
//
//  Created by Ajay Kunte on 22/05/24.
//

import Foundation

// MARK: - NetworkConstants
struct NetworkConstants {
    static let baseUrl = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&start_date=2024-01-01&end_date=2024-02-01"
    static let somethingWentWrong = "Something went wrong"
}

// MARK: - ScreenConstants
struct ScreenConstants {
    static let homeTitle = "Astronomy Data"
    static let capturedTitle = "Captured On"
    static let capturedByTitle = "Captured By"
}
