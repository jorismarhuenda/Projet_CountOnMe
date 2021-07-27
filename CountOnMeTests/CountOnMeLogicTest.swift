//
//  CountOnMeLogicTest.swift
//  CountOnMeTests
//
//  Created by marhuenda joris on 26/07/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeLogicTest: XCTestCase {
    var countOnMe: CountOnMeLogic!
    override func setUp() {
        super.setUp()
        countOnMe = CountOnMeLogic()
    }
    func testGivenIsExpressionIsCorrect_WhenStringNumberContainNothing_ThenExpressionReturnFalse() {
        XCTAssertFalse(countOnMe.isExpressionIsCorrect)
    }
    func testGivenIsExpressionIsCorrect_WhenExpressionTappedIsNotCorrect_ThenExpressionReturnFalse() {
        countOnMe.addNewNumber(1)
        countOnMe.plus()
        countOnMe.primaryCalculations()
        XCTAssertFalse(countOnMe.isExpressionIsCorrect)
    }
}
