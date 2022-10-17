//
//  Mamas_Lunch_on_the_GoUITestsLaunchTests.swift
//  Mamas Lunch on the GoUITests
//
//  Created by Biasi Wiga on 17/10/2022.
//

import XCTest

final class Mamas_Lunch_on_the_GoUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
