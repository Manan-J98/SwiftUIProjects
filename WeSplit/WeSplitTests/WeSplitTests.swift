//
//  WeSplitTests.swift
//  WeSplitTests
//
//  Created by Manan Juneja on 2025-01-23.
//

import XCTest
@testable import WeSplit

final class WeSplitTests: XCTestCase {

    func testSuccessfulTipAmount() {
        // Arrange
        let billAmount = 500.0
        let tip = 10.0
        let calculation = Calculate()
        //Act
        let tipAmount = calculation.calcluateTip(billAmount: billAmount, tip: tip)
        
        // Assert
        XCTAssertEqual(tipAmount, 50)
    }

}
