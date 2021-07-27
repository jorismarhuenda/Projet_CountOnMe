//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numbersButton: [UIButton]!
    @IBOutlet var operatorButtons: [UIButton]!

    var countOnMeLogic = CountOnMeLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedNumberButtons(_ sender: UIButton) {
        countOnMeLogic.addNewNumber(sender.tag)
    }
    @IBAction func tappedOperatorButtons(_ sender: UIButton) {
        switch sender.title(for: .normal) {
        case "+":
            countOnMeLogic.plus()
        case "-":
            countOnMeLogic.minus()
        case "X":
            countOnMeLogic.multiply()
        case "/":
            countOnMeLogic.divide()
        case "=":
            countOnMeLogic.primaryCalculations()
        case "Suppr":
            countOnMeLogic.clear()
        default:
            break
        }
    }
}
