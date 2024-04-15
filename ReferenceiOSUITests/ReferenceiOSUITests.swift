//
//  ReferenceiOSUITests.swift
//  ReferenceiOSUITests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import XCTest
@testable import ReferenceiOS

class ReferenceiOSUITests: XCTestCase {
    
    let currencyRobot = CurrencyRobot()
    var app: XCUIApplication!

        override func setUpWithError() throws {
            continueAfterFailure = false
            app = XCUIApplication()
            app.launch()
        }

        override func tearDownWithError() throws {
            app = nil
        }
    
    //Test to verify that the initial label is displayed
    func testInitialLabel(){
        currencyRobot.initialLabel()
    }
    
    //Test to verify that lable is updated from initial label to the lable with data in correct currency format
    func testButtonUpdatesLabelWithCurrencyFormat() throws {
        let label = app.staticTexts["label"]
        currencyRobot.buttonTap()
        let updatedLabelText = label.label
        XCTAssertTrue(currencyRobot.isValidCurrencyFormat(updatedLabelText))
    }
    
    // Test the application accessibility by putting it into background, reopening and swiping the screen
    func testAppAccesibility(){
        let label = app.staticTexts["label"]
        currencyRobot.buttonTap()
        currencyRobot.appIntoBackground()
        currencyRobot.appReopen()
        currencyRobot.screenSwipe()
        currencyRobot.buttonTest()
        let updatedLabelText = label.label
        XCTAssertTrue(currencyRobot.isValidCurrencyFormat(updatedLabelText))
    }
    
    // Test the application in landscape mode
    func testLandscapeMode(){
        XCUIDevice.shared.orientation = .landscapeLeft
        let label = app.staticTexts["label"]
        currencyRobot.initialLabel()
        currencyRobot.buttonTap()
        let updatedLabelText = label.label
        XCTAssertTrue(currencyRobot.isValidCurrencyFormat(updatedLabelText))
    }
    
}

