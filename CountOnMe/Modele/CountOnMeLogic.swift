//
//  CountOnMeLogic.swift
//  CountOnMe
//
//  Created by marhuenda joris on 25/07/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
import UIKit

protocol CountOnMeDelegate {
    func alertShow(title: String, message: String)
    func updateTextView(label: String)
}

class CountOnMeLogic {
    //Array of numbers.
    var stringNumber: [String] = [String()]
    
    //Array of operators.
    var operators: [String] = ["+"]
    var index = 0
    
    //Var that holds the delegate.
    var countOnMeDelegate: CountOnMeDelegate?
    
    //Var checking if the expression is correctly typed by the user, else it will alert the user.
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
    
    //Var checking if a string of numbers contains something, else it will alert the user to type a string of numbers first and then the user can add an operator.
    var canAddOperator: Bool {
        if let stringNumber = stringNumber.last {
            if stringNumber.isEmpty {
                countOnMeDelegate?.alertShow(title: "Zero!", message: "Wrong expression!")
                return false
            }
        }
        return true
    }
}
