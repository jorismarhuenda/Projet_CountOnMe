//
//  ViewController.swift
//  SimpleCalc
//
//  Created by marhuenda joris on 25/07/2021.
//  Copyright © 2021 marhuenda joris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numbersButton: [UIButton]!
    @IBOutlet var operatorButtons: [UIButton]!

    var countOnMeLogic = CountOnMeLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
        countOnMeLogic.countOnMeDelegate = self
    }
    // Managing IBAction of the different number's buttons with tag.
    @IBAction func tappedNumberButtons(_ sender: UIButton) {
        countOnMeLogic.addNewNumber(sender.tag)
    }
    // Managing IBAction of the different operator's buttons.
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
            countOnMeLogic.finalCalculation()
        default:
            break
        }
    }
}
// Using extension with protocol to delegate, in order to manage alerts and update the display, to the model.
extension ViewController: CountOnMeDelegate {
    func alertShow(title: String, message: String) {
        updateShowAlert(title: title, message: message)
    }
    func updateTextView(label: String) {
        textView.text = label
    }
}
