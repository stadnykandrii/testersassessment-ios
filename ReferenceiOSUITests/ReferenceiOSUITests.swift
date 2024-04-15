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
    func testInitialLabelDisplayed(){
        currencyRobot.verifyInitialLabelDisplayed()
    }
    
    //Test to verify that lable is updated from initial label to the lable with data in correct currency format
    func testButtonUpdatesLabelWithCurrencyFormat() throws {
        let label = app.staticTexts["label"]
        currencyRobot.tapButton()
        let updatedLabelText = label.label
        XCTAssertTrue(currencyRobot.checkCurrencyFormat(updatedLabelText), "Currency format is not correct")
    }
    
    // Test the application accessibility by putting it into background, reopening and swiping the screen and testing the button responsiveness, making sure that app is still functioning as expected
    func testAppAccesibility(){
        let label = app.staticTexts["label"]
        currencyRobot.tapButton()
        currencyRobot.putAppIntoBackground()
        currencyRobot.reopenApp()
        currencyRobot.swipeScreen()
        currencyRobot.testButtonResponsiveness()
        let updatedLabelText = label.label
        XCTAssertTrue(currencyRobot.checkCurrencyFormat(updatedLabelText), "Currency format is not correct")
    }
    
    // Test the application in landscape mode
    func testLandscapeMode(){
        XCUIDevice.shared.orientation = .landscapeLeft
        let label = app.staticTexts["label"]
        currencyRobot.verifyInitialLabelDisplayed()
        currencyRobot.tapButton()
        let updatedLabelText = label.label
        XCTAssertTrue(currencyRobot.checkCurrencyFormat(updatedLabelText), "Currency format is not correct")
        XCUIDevice.shared.orientation = .portrait
        currencyRobot.tapButton()
        let updatedLabelText2 = label.label
        XCTAssertTrue(currencyRobot.checkCurrencyFormat(updatedLabelText2), "Currency format is not correct")
    }
    
}

