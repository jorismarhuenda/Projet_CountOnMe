//
//  UIViewControllerExtension.swift
//  CountOnMe
//
//  Created by marhuenda joris on 31/07/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    // Method showing alerts to user when user's inputs are wrong.
    func updateShowAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alertVC, animated: true, completion: nil)
    }
}
