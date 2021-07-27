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
            countOnMeLogic.primaryCalculations()
        case "Suppr":
            countOnMeLogic.clear()
        default:
            break
        }
    }
}
extension UIViewController {
    //Method showing alerts to user when user's inputs are wrong
    func updateShowAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alertVC, animated: true, completion: nil)
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
