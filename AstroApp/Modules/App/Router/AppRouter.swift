//
//  AppRouter.swift
//  AstroApp
//
//  Created by Ajay Kunte on 22/05/24.
//

import Foundation
import SwiftUI

class AppRouter {
    /// Returns the DetailsPage UI view for navigation
    /// - Parameter data: Selected Astronomy data cell
    /// - Returns: DetailsPage
    func navigateToDetailsPage(_ data: NasaDataModelElement) -> DetailsPage {
        return DetailsPage(title: data.title ?? "", image: data.url ?? "", description: data.explanation ?? "")
    }
}
