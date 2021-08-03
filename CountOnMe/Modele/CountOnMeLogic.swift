//
//  CountOnMeLogic.swift
//  CountOnMe
//
//  Created by marhuenda joris on 25/07/2021.
//  Copyright © 2021 marhuenda joris. All rights reserved.
//

import Foundation
import UIKit

// Using protocol to delegate alerts and update the display.
protocol CountOnMeDelegate: AnyObject {
    func alertShow(title: String, message: String)
    func updateTextView(label: String)
}
// swiftlint:disable weak_delegate
class CountOnMeLogic {
    // MARK: - Properties
    // Array of numbers.
    var stringNumbers: [String] = [String()]
    // Array of operators.
    var operators: [String] = ["+"]
    var index = 0
    // Var that holds the delegate.
    var countOnMeDelegate: CountOnMeDelegate?
    // Var checking if the expression is correctly typed by the user, else it will alert the user.
    var isExpressionIsCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumber.count == 1 {
                    countOnMeDelegate?.alertShow(title: "Nothing!", message: "Start new calculation")
                } else {
                    countOnMeDelegate?.alertShow(title: "Nothing!", message: "Type correct expression please")
                }
                return false
            }
        }
        return true
    }
    // Var checking if a string of numbers contains something.
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                countOnMeDelegate?.alertShow(title: "Nothing!", message: "Wrong expression")
                return false
            }
        }
        return true
    }
    // MARK: - Methodes
    // Method managing numbers when user types them.
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
        updateLabelText()
    }
    // Method managing operations plus and minus.
    func finalCalculation() {
        if !isExpressionIsCorrect {
            return
        }
        orderOfOperations()
        var total = Double()
        for (index, stringNumber) in stringNumbers.enumerated() {
            guard let number = Double(stringNumber) else { return }
            if operators[index] == "+" {
                total += number
            } else if operators[index] == "-" {
                total -= number
            }
        }
        let result = String(format: "%.3f", total)
        countOnMeDelegate?.updateTextView(label: result)
    }
    // swiftlint:disable identifier_name
    // Method managing order of operations and managing operations multiply and divide.
    func orderOfOperations() {
        let priorityOperators = ["X", "/"]
        var result: Double = 0
        var i = 0
        while i < stringNumbers.count - 1 {
            if var firstOperator = Double(stringNumbers[i]) {
                while priorityOperators.contains(operators[i + 1]) {
                    if let secondOperator = Double(stringNumbers[i + 1]) {
                        if operators[i + 1] == "X" {
                            result = firstOperator * secondOperator
                        } else if operators[i + 1] == "/" && secondOperator != 0 {
                            result = firstOperator / secondOperator
                        } else {
                            countOnMeDelegate?.alertShow(title: "Error", message: "You can't divide by 0")
                            result = 0
                        }
                        stringNumbers[i] = String(result)
                        firstOperator = result
                        stringNumbers.remove(at: i + 1)
                        operators.remove(at: i + 1)
                        if i == stringNumbers.count - 1 {
                            return
                        }
                    }
                }
                i += 1
            }
        }
    }
    // Method managing reset of the label's text.
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        index = 0
        updateLabelText()
    }
    // Method managing the divide operator when user types it.
    func divide() {
        if canAddOperator {
            operators.append("/")
            stringNumbers.append("")
            updateLabelText()
        }
    }
    // Method managing the multiply operator when user types it.
    func multiply() {
        if canAddOperator {
            operators.append("X")
            stringNumbers.append("")
            updateLabelText()
        }
    }
    // Method managing the minus operator when users types it.
    func minus() {
        if canAddOperator {
            operators.append("-")
            stringNumbers.append("")
            updateLabelText()
        }
    }
    // Method managing the plus operator when users types it.
    func plus() {
        if canAddOperator {
            operators.append("+")
            stringNumbers.append("")
            updateLabelText()
        }
    }
    // Method managing to update the label text.
    func updateLabelText() {
        var text = ""
        for (index, stringNumber) in stringNumbers.enumerated() {
            // Add operator.
            if index > 0 {
                text += operators[index]
            }
            // Add number.
            text += stringNumber
        }
        countOnMeDelegate?.updateTextView(label: text)
    }
}
