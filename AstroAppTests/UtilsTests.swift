//
//  UtilsTests.swift
//  AstroAppTests
//
//  Created by Ajay Kunte on 22/05/24.
//

import XCTest
@testable import AstroApp

final class UtilsTests: XCTestCase {
    func testToDate() {
        XCTAssertTrue(("2024-05-24".toDate(.isoDate) != nil))
    }
}
