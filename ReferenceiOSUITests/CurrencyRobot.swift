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
    
    //Function to verify that the initial label is displayed
    @discardableResult
    func initialLabel() -> Self{
        let label = app.staticTexts["label"]
        let labelText = label.label
        XCTAssertTrue(labelText.contains("Hello"), "Initial label is not displayed")
        return self
    }
    
    //Function to tap the button
    @discardableResult
    func buttonTap() -> Self{
        let button = app.buttons["Button"]
        XCTAssertTrue(button.exists, "Button is not displayed")
        button.tap()
        return self
    }
    
    //Function to verify that the lable has a correct currency format
    @discardableResult
    func isValidCurrencyFormat(_ text: String) -> Bool {
        return text.contains("€") && text.contains(".") && text.contains(",")
    }
    

    //Function to put the app into background
    @discardableResult
    func appIntoBackground() -> Self{
        XCUIDevice.shared.press(.home)
        return self
    }
    
    //Function to reopen the app
    @discardableResult
    func appReopen() -> Self{
        app.activate()
        return self
    }
    
    //Function to swipe the screen in order to verify that the label is displayed
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
    
    //Function to test that the button is responsive
    @discardableResult
    func buttonTest() -> Self{
        let button = app.buttons["Button"]
        button.tap()
        button.doubleTap()
        button.press(forDuration: 2)
        return self
    }
    
}
