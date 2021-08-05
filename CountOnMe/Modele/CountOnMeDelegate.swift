//
//  CountOnMeDelegate.swift
//  CountOnMe
//
//  Created by marhuenda joris on 05/08/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

// Using protocol to delegate alerts and update the display.
protocol CountOnMeDelegate: AnyObject {
    func alertShow(title: String, message: String)
    func updateTextView(label: String)
}
