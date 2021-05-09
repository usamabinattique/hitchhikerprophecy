//
//  HomeSceneInteractorTests.swift
//  The Hitchhiker ProphecyTests
//
//  Created by usama on 09/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy
//@testable import The_Hitchhiker_Prophecy

class HomeSceneInteractorTests: XCTestCase {
    
    var sut: HomeSceneInteractor?
    var homeWorker: HomeWorkerType!
    var presenter: HomeScenePresentationLogic!
    
    override func setUp() {
        super.setUp()
        
        sut = HomeSceneInteractor(worker: <#T##HomeWorkerType#>, presenter: <#T##HomeScenePresentationLogic#>)
        
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
    }

}
