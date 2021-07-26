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
                    countOnMeDelegate?.alertShow(title: "Zero", message: "Start new calculation")
                } else {
                    countOnMeDelegate?.alertShow(title: "Zero", message: "Type correct expression please")
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
                countOnMeDelegate?.alertShow(title: "Zero!", message: "Wrong expression!")
                return false
            }
        }
        return true
    }
    // Method managing numbers when user types them.
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumber.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumber[stringNumber.count-1] = stringNumberMutable
        }
        updateLabelText()
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
    // Method managing the minus operator when users types it
    func minus() {
        if canAddOperator {
            operators.append("-")
            stringNumber.append("")
            updateLabelText()
        }
    }
    // Method managing the plus operator when users types it
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
            // Add operator
            if index > 0 {
                text += operators[index]
            }
            // Add number
            text += stringNumber
        }
        countOnMeDelegate?.updateTextView(label: text)
    }
}
