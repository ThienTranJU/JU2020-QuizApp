//
//  QuizApp_LabProjectUITests.swift
//  QuizApp_LabProjectUITests
//
//  Created by Thiên Trân on 2020-10-28.
//

import XCTest

class QuizApp_LabProjectUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testGame() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Start"].tap()
        
        var rightAnswers = 0
        app.buttons.firstMatch.tap()
        XCTAssertEqual(app.alerts.count, 1)
        if app.alerts.staticTexts["Correct 🥳"].exists {
            rightAnswers += 1
        }
        app.alerts.buttons.firstMatch.tap()
        
        
        
        app.buttons.firstMatch.tap()
        XCTAssertEqual(app.alerts.count, 1)
        if app.alerts.staticTexts["Correct 🥳"].exists {
            rightAnswers += 1
        }
        app.alerts.buttons.firstMatch.tap()

        app.buttons.firstMatch.tap()
        XCTAssertEqual(app.alerts.count, 1)
        if app.alerts.staticTexts["Correct 🥳"].exists {
            rightAnswers += 1
        }
        app.alerts.buttons.firstMatch.tap()

        app.buttons.firstMatch.tap()
        XCTAssertEqual(app.alerts.count, 1)
        if app.alerts.staticTexts["Correct 🥳"].exists {
            rightAnswers += 1
        }
        app.alerts.buttons.firstMatch.tap()

        app.buttons.firstMatch.tap()
        XCTAssertEqual(app.alerts.count, 1)
        if app.alerts.staticTexts["Correct 🥳"].exists {
            rightAnswers += 1
        }
        app.alerts.buttons.firstMatch.tap()

        
        XCTAssertTrue(app.staticTexts["Your Result"].exists)
        XCTAssertTrue(app.staticTexts["You have \(rightAnswers) correct answers out of 5 questions"].exists)
    }
}
