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
    
    func testInitialLabel(){
        currencyRobot.initialLabel()
    }
    
    func testButtonUpdatesLabelWithCurrencyFormat() throws {
        let label = app.staticTexts["label"]
        currencyRobot.buttonTap()
        let updatedLabelText = label.label
        XCTAssertTrue(currencyRobot.isValidCurrencyFormat(updatedLabelText))
    }
    
    
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

    func testLandscapeMode(){
        XCUIDevice.shared.orientation = .landscapeLeft
        let label = app.staticTexts["label"]
        currencyRobot.initialLabel()
        currencyRobot.buttonTap()
        let updatedLabelText = label.label
        XCTAssertTrue(currencyRobot.isValidCurrencyFormat(updatedLabelText))
    }
    
}
