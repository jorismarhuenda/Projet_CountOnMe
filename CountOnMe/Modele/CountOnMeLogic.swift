//
//  CountOnMeLogic.swift
//  CountOnMe
//
//  Created by marhuenda joris on 25/07/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
import UIKit

// Using protocol to delegate alerts and update the display.
protocol CountOnMeDelegate {
    func alertShow(title: String, message: String)
    func updateTextView(label: String)
}

class CountOnMeLogic {
    //MARK: -Properties
    // Array of numbers.
    var stringNumber: [String] = [String()]
    // Array of operators.
    var operators: [String] = ["+"]
    var index = 0
    // Var that holds the delegate.
    var countOnMeDelegate: CountOnMeDelegate?
    // Var checking if the expression is correctly typed by the user, else it will alert the user.
    var isExpressionIsCorrect: Bool {
        if let stringNumber = stringNumber.last {
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
        if let stringNumber = stringNumber.last {
            if stringNumber.isEmpty {
                countOnMeDelegate?.alertShow(title: "Nothing!", message: "Wrong expression")
                return false
            }
        }
        return true
    }
    //MARK: -Methodes
    // Method managing numbers when user types them.
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumber.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
        }
        updateLabelText()
    }
    // Method managing operations plus and minus.
    func primaryCalculations() {
        if !isExpressionIsCorrect {
            return
        }
        orderOfOperations()
        var total = Double()
        for (index, stringNumber) in stringNumber.enumerated() {
            guard let number = Double(stringNumber) else { return }
            if operators[index] == "+" {
                total += number
            } else if operators[index] == "-" {
                total -= number
            }
        }
        let result = String(format: "%.3f", total)
        countOnMeDelegate?.updateTextView(label: result)
        clear()
    }
    // Method managing order of operations and managing operations multiply and divide.
    func orderOfOperations() {
        let priorityOperators = ["X", "/"]
        var result: Double = 0
        var chiffre = 0
        while chiffre < stringNumber.count - 1 {
            if var firstOperator = Double(stringNumber[chiffre]) {
                while priorityOperators.contains(operators[chiffre + 1]) {
                    if let secondOperator = Double(stringNumber[chiffre + 1]) {
                        if operators[chiffre + 1] == "X" {
                            result = firstOperator * secondOperator
                        } else if operators[chiffre + 1] == "/" && secondOperator != 0 {
                            result = firstOperator / secondOperator
                        } else {
                            countOnMeDelegate?.alertShow(title: "Error", message: "You can't divide by 0")
                            result = 0
                        }
                        stringNumber[chiffre] = String(result)
                        firstOperator = result
                        stringNumber.remove(at: chiffre + 1)
                        operators.remove(at: chiffre + 1)
                        if chiffre == stringNumber.count - 1 {
                            return
                        }
                    }
                }
                chiffre += 1
            }
        }
    }
    // Method managing reset of the label's text.
    func clear() {
        stringNumber = [String()]
        operators = ["Suppr"]
        index = 0
    }
    // Method managing the divide operator when user types it.
    func divide() {
        if canAddOperator {
            operators.append("/")
            stringNumber.append("")
            updateLabelText()
        }
    }
    // Method managing the multiply operator when user types it.
    func multiply() {
        if canAddOperator {
            operators.append("X")
            stringNumber.append("")
            updateLabelText()
        }
    }
    // Method managing the minus operator when users types it.
    func minus() {
        if canAddOperator {
            operators.append("-")
            stringNumber.append("")
            updateLabelText()
        }
    }
    // Method managing the plus operator when users types it.
    func plus() {
        if canAddOperator {
            operators.append("+")
            stringNumber.append("")
            updateLabelText()
        }
    }
    // Method managing to update the label text.
    func updateLabelText() {
        var text = ""
        for (index, stringNumber) in stringNumber.enumerated() {
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
