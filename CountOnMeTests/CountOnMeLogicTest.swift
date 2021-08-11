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
    var countOnMeDelegateMock = CountOnMeDelegateMock()
    var countOnMe: CountOnMeLogic!
    override func setUp() {
        super.setUp()
        countOnMe = CountOnMeLogic()
    }
    private let calculate = CountOnMeLogic()
    private var stringNumber: [String] = [String()]
    private var operators: [String] = [String()]
    
    func testGivenIsExpressionIsCorrect_WhenStringNumberContainNothing_ThenExpressionReturnFalse() {
        XCTAssertFalse(countOnMe.isExpressionIsCorrect)
    }
    func testGivenIsExpressionIsCorrect_WhenExpressionTappedIsNotCorrect_ThenExpressionReturnFalse() {
        countOnMe.addNewNumber(1)
        countOnMe.plus()
        countOnMe.finalCalculation()
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
        XCTAssert(countOnMe.operators == ["+"])
        XCTAssert(countOnMe.index == 0)
    }
    func testGivenEmptyStringNumber_WhenAddingManyNumber_ThenTheseNumbersAreDisplayed() {
        countOnMe.addNewNumber(1)
        countOnMe.addNewNumber(2)
        stringNumber = countOnMe.getStringNumber()
        XCTAssertEqual(stringNumber[0], "12")
    }
    func testGivenEmptyOperators_WhenAddingPlusOperator_ThenOperatorPlusAdd() {
        print(countOnMe.getOperators())
        countOnMe.addNewNumber(1)
        countOnMe.plus()
        operators = countOnMe.getOperators()
        XCTAssertEqual(operators[1], "+")
    }
    func testGivenEmptyOperators_WhenAddingMinusOperator_ThenOperatorMinusAdd() {
        countOnMe.addNewNumber(1)
        countOnMe.minus()
        operators = countOnMe.getOperators()
        XCTAssertEqual(operators[1], "-")
    }
    func testGivenEmptyOperators_WhenAddingMultiplyOperator_ThenOperatorMultiplyAdd() {
        countOnMe.addNewNumber(1)
        countOnMe.multiply()
        operators = countOnMe.getOperators()
        XCTAssertEqual(operators[1], "X")
    }
    func testGivenEmptyOperators_WhenAddingDivideOperator_ThenOperatorDivideAdd() {
        countOnMe.addNewNumber(1)
        countOnMe.divide()
        operators = countOnMe.getOperators()
        XCTAssertEqual(operators[1], "/")
    }
    func testGivenEmptyStringNumber_WhenAddingNumberAndPoint_ThenThisDecimalNumberIsDisplayed() {
        countOnMe.addNewNumber(1)
        countOnMe.addPoint()
        countOnMe.addNewNumber(2)
        stringNumber = countOnMe.getStringNumber()
        XCTAssertEqual(stringNumber[0], "1.2")
    }
    func testNumberOne_GivenTotalIsNull_WhenMultipleOperationAdded_ThenTheOperationGivesAResult() {
        countOnMe.addNewNumber(1)
        countOnMe.addPoint()
        countOnMe.addNewNumber(2)
        countOnMe.plus()
        countOnMe.addNewNumber(1)
        countOnMe.addNewNumber(2)
        countOnMe.minus()
        countOnMe.addNewNumber(3)
        countOnMe.multiply()
        countOnMe.addNewNumber(4)
        countOnMe.divide()
        countOnMe.addNewNumber(5)
        let total: () = countOnMe.finalCalculation()
        XCTAssertEqual(total, "10.8")
        }
}
