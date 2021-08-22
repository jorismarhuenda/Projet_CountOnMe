//
//  DecimalExtension.swift
//  CountOnMe
//
//  Created by marhuenda joris on 19/08/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

extension Double {
    func string() -> String {
        let decimalResult = NumberFormatter()
        decimalResult.minimumFractionDigits = 0
        decimalResult.maximumFractionDigits = 9
        return decimalResult.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
