//
//  RickAndMortyAPIUITests.swift
//  RickAndMortyAPIUITests
//
//  Created by Nikaestu on 16/04/2023.
//

import XCTest

final class RickAndMortyAPIUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDownWithError() throws {
        app = nil
        super.tearDown()
    }
    
    func testCharactersListDisplayed() {
        
        app.launch()
        
        let listCells = app.tables.cells
            
        // On vérifie que la liste contient bien au moins un élément
        XCTAssertTrue(listCells.count > 0)
            
        // On sélectionne le premier élément de la liste
        listCells.element(boundBy: 0).tap()
            
        // On vérifie que l'écran de détail s'affiche
        XCTAssertTrue(app.navigationBars["Détail du personnage"].exists)
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
