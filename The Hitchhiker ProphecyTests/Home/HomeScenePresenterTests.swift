//
//  HomeScenePresenterTests.swift
//  The Hitchhiker ProphecyTests
//
//  Created by usama on 10/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class HomeScenePresenterTests: XCTestCase {
    
    var sut: HomeScenePresneter!
    var mockDisplayView: HomeSceneDisplayView?
    var mockInteractor: HomeMockInteractor?
    
    override func setUpWithError() throws {
    
        mockDisplayView = HomeMockViewController()
        mockInteractor = HomeMockInteractor(worker: HomeSearchWorker(), presenter: HomeScenePresneter(displayView: mockDisplayView!))
        sut = HomeScenePresneter(displayView: mockDisplayView!)
                
    }

    override func tearDownWithError() throws {
        mockInteractor = nil
        mockDisplayView = nil
        sut = nil
    }
    
    
    func test_displayViewShouldNotBeNil() {
        sut = HomeScenePresneter(displayView: mockDisplayView!)
        XCTAssertNotNil(sut?.displayView)

    }

    func test_presenterSuccessfullyPassesDataToController() {
        mockInteractor?.fileName = "ServerResponse"
        mockInteractor?.fetchCharacters()
    }
    
    func test_presenterFailsToPassDataWithError() {
        mockInteractor?.fileName = "InvalidFileName"
        mockInteractor?.fetchCharacters()
    }
}
