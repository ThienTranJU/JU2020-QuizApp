//
//  HtmlDecoderTests.swift
//  QuizApp_LabProjectTests
//
//  Created by Thiên Trân on 2020-11-18.
//

import XCTest
@testable import QuizApp_LabProject

class HtmlDecoderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHTMLDecoding() throws {
        let encodedString = "&quot;"
        
        XCTAssertEqual(encodedString.htmlDecoded, "\"")
        
        let encodedUmlaut = "&auml;"
        
        XCTAssert(encodedUmlaut.htmlDecoded == "ä")
    }

}
