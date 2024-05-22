//
//  AppPresenterTests.swift
//  AstroAppTests
//
//  Created by Ajay Kunte on 22/05/24.
//

import XCTest
@testable import AstroApp

final class AppPresenterTests: XCTestCase {
    var presenter = AppPresenter()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testIsWithinLastSevenDays() {
        XCTAssertTrue(presenter.isWithinLastSevenDays(selectedDate: Date()))
    }

    func testFetchLastSevenDaysData() {
        XCTAssertNoThrow(presenter.fetchLastSevenDaysData(from: [NasaDataModelElement(date: "2024-01-01", explanation: "", hdurl: "", mediaType: "", serviceVersion: "", title: "", url: "", copyright: "")]))
    }
    
    func testDidFinishAPI() {
        XCTAssertNoThrow(presenter.didFinishAPI(.success([NasaDataModelElement(date: "2024-01-01", explanation: "", hdurl: "", mediaType: "", serviceVersion: "", title: "", url: "", copyright: "")])))
    }
    
    func testFetchAstronomyData() {
        let expectation = self.expectation(description: "Fetch Astonomy Data")
        presenter.fetchAstronomyData()
        expectation.fulfill()
        wait(for: [expectation], timeout: 5.0)
    }
}
