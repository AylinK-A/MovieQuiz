//
//  MovieQuizUITests.swift
//  MovieQuizUITests
//
//  Created by Айлин Кызылай on 08.06.2025.
//
import XCTest

final class MovieQuizUITests: XCTestCase {
    // swiftlint:disable:next implicitly_unwrapped_optional
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        continueAfterFailure = false
    }
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        app.terminate()
        app = nil
    }
    func testYesButton() {
        sleep(3)
        let indexLabel = app.staticTexts["Index"]
        let firstPoster = app.images["Poster"]
        let firstPosterData = firstPoster.screenshot()
            .pngRepresentation
        
        app.buttons["Yes"].tap()
        sleep(3)
        
        let secondPoster = app.images["Poster"]
        let secondPosterData = secondPoster.screenshot()
            .pngRepresentation
    
        XCTAssertFalse(firstPoster == secondPoster)
        XCTAssertEqual(indexLabel.label, "2/10")
    }
    func testNoButton() {
        sleep(3)
        let indexlabel = app.staticTexts["Index"]
        let firstPoster = app.images["Poster"]
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        
        app.buttons["No"].tap()
        sleep(3)
        
        let secondPoster = app.images["Poster"]
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        
        XCTAssertFalse(firstPoster == secondPoster)
        XCTAssertEqual(indexlabel.label, "2/10")
    }
    
    func testGameFinish() {
        sleep(5)
        for _ in 1...10 {
            app.buttons["No"].tap()
            sleep(5)
        }

        let alert = app.alerts["GameResultsAlert"]
        XCTAssertTrue(alert.exists)
        
        XCTAssertTrue(alert.label == "Этот раунд окончен!")
        XCTAssertTrue(alert.buttons.firstMatch.label == "Сыграть ещё раз")
    }

    func testAlertDismiss() {
        sleep(5)
        for _ in 1...10 {
            app.buttons["No"].tap()
            sleep(5)
        }
        
        let playAgainButton = app.buttons["PlayAgainButton"]
            XCTAssertTrue(playAgainButton.waitForExistence(timeout: 5))
            playAgainButton.tap()
        
        sleep(2)
        
        let indexLabel = app.staticTexts["Index"]
        
        XCTAssertTrue(indexLabel.exists)
        XCTAssertTrue(indexLabel.label == "1/10")
    }
    
}
