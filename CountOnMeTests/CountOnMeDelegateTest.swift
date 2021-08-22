//
//  CountOnMeDelegateTest.swift
//  CountOnMeTests
//
//  Created by marhuenda joris on 05/08/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeDelegateMock: CountOnMeDelegate {
    var textViewMock: String = "0"
    var errorMock: String?
    func alertShow(title: String, message: String) {
        errorMock = message
    }
    func updateTextView(label: String) {
        textViewMock = label
    }
}
