//
//  CurrencyRobot.swift
//  ReferenceiOSUITests
//
//  Created by Andrii Stadnyk on 14/04/2024.
//  Copyright © 2024 ABN AMRO. All rights reserved.
//

import Foundation
import XCTest

class CurrencyRobot {
    var app = XCUIApplication()
    
    @discardableResult
    func initialLabel() -> Self{
        let label = app.staticTexts["label"]
        let labelText = label.label
        XCTAssertTrue(labelText.contains("Hello"), "Initial label is not displayed")
        return self
    }
    
    @discardableResult
    func buttonTap() -> Self{
        let button = app.buttons["Button"]
        XCTAssertTrue(button.exists, "Button is not displayed")
        button.tap()
        return self
    }
    
    @discardableResult
    func isValidCurrencyFormat(_ text: String) -> Bool {
        return text.contains("€") && text.contains(".") && text.contains(",")
    }
    
    @discardableResult
    func runApp() -> Self{
        app.activate()
        return self
    }
    
    @discardableResult
    func appIntoBackground() -> Self{
        XCUIDevice.shared.press(.home)
        return self
    }
    
    @discardableResult
    func appReopen() -> Self{
        app.activate()
        return self
    }
    
    @discardableResult
    func screenSwipe() -> Self{
        let label = app.staticTexts["label"]
        app.swipeUp()
        app.swipeDown()
        app.swipeLeft()
        app.swipeRight()
        XCTAssertTrue(label.exists, "Label is not displayed")
        return self
    }
    
    @discardableResult
    func buttonTest() -> Self{
        let button = app.buttons["Button"]
        button.tap()
        button.doubleTap()
        button.press(forDuration: 2)
        return self
    }
    
}
