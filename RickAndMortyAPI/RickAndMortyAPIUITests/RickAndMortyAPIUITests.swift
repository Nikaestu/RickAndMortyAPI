//
//  RickAndMortyAPIUITests.swift
//  RickAndMortyAPIUITests
//
//  Created by Nikaestu on 16/04/2023.
//

import XCTest

final class RickAndMortyAPIUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    //Mes tests
    func testApp() {
        let app = XCUIApplication()
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        XCTAssertNotNil(collectionViewsQuery)
        
        let rRRickSanchezButton = collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["R, R, RICK SANCHEZ"]/*[[".cells.buttons[\"R, R, RICK SANCHEZ\"]",".buttons[\"R, R, RICK SANCHEZ\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(rRRickSanchezButton.exists)
        
        rRRickSanchezButton.tap()
    
        let backButon = app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Back"]
        XCTAssertTrue(backButon.exists)
            
        backButon.tap()
        
        let tabBarButonAbout = app.tabBars["Tab Bar"].buttons["A propos"]
        XCTAssertTrue(tabBarButonAbout.exists)
        
        tabBarButonAbout.tap()
        
        let versionButton = collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Version payante"]/*[[".cells.buttons[\"Version payante\"]",".buttons[\"Version payante\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(versionButton.exists)
        
        versionButton.tap()
        
        let tabBarButonCharacters = app.tabBars["Tab Bar"].buttons["Personnages"]
        XCTAssertTrue(tabBarButonCharacters.exists)

        tabBarButonCharacters.tap()
                        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
