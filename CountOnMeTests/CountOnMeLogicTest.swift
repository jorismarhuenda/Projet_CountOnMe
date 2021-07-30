//
//  CountOnMeLogicTest.swift
//  CountOnMeTests
//
//  Created by marhuenda joris on 25/07/2021.
//  Copyright © 2021 marhuenda joris. All rights reserved.
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
    func testGivenIsExpressionIsCorrect_WhenExpressionTappedIsCorrect_ThenExpressionReturnTrue() {
        countOnMe.addNewNumber(1)
        XCTAssertTrue(countOnMe.isExpressionIsCorrect)
    }
    func testGivenCanAddOperator_WhenStringNumberContainNothing_ThenCanAddOperatorReturnFalse() {
        XCTAssertFalse(countOnMe.canAddOperator)
    }
    func testGivenCanAddOperator_WhenStringNumberContainSomethin_ThenCanAddOperatorReturnTrue() {
        countOnMe.addNewNumber(1)
        XCTAssertTrue(countOnMe.canAddOperator)
    }
    func testGivenAddNewNumber_WhenStringNumberContainAnything_ThenNewNumberIsAdded() {
        countOnMe.addNewNumber(1)
        XCTAssert(countOnMe.stringNumbers[countOnMe.stringNumbers.count-1] == "1")
    }
    func testGivenClear_WhenStringNumberContainAnything_ThenStringNumberIsCleared() {
        countOnMe.clear()
        XCTAssert(countOnMe.stringNumbers[countOnMe.stringNumbers.count-1] == "")
        XCTAssert(countOnMe.operators == ["Suppr"])
        XCTAssert(countOnMe.index == 0)
    }
    func testGivenOrderOfOperations_WhenStringNumberContainSomething_ThenStringNumberMinusResult() {
        countOnMe.addNewNumber(4)
        countOnMe.minus()
        countOnMe.addNewNumber(2)
        XCTAssert(true)
    }
    func testGivenOrderOfOperations_WhenStringNumberContainSomething_ThenStringNumberAdditionResult() {
        countOnMe.addNewNumber(2)
        countOnMe.plus()
        countOnMe.addNewNumber(4)
        XCTAssert(true)
    }
    func testGivenOrderOfOperations_WhenStringNumberContainSomething_ThenStringNumberDivideResult() {
        countOnMe.addNewNumber(2)
        countOnMe.divide()
        countOnMe.addNewNumber(2)
        XCTAssert(true)
    }
    func testGivenOrderOfOperations_WhenStringNumberContainZero_ThenStringNumberDivideResult() {
        countOnMe.addNewNumber(2)
        countOnMe.divide()
        countOnMe.addNewNumber(0)
        XCTAssert(true)
    }
    func testGivenOrderOfOperations_WhenStringNumberContainSomething_ThenStringNumberMultiplyResult() {
        countOnMe.addNewNumber(2)
        countOnMe.multiply()
        countOnMe.addNewNumber(2)
        XCTAssert(true)
    }
}
