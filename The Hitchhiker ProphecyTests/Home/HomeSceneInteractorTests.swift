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
    private var expectation: XCTestExpectation!

    
    override func setUpWithError() throws {
        
        sut = HomeSceneInteractor(worker: HomeSearchWorker(), presenter: HomeScenePresneter(displayView: self))
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    //This test case will hit the api and check for results
    func test_InteractorHasValidData() {
        self.expectation = expectation(description: "Got the list of characters successfully")
    
        sut?.fetchCharacters()
        wait(for: [expectation], timeout: 10)
        
        if let sut = sut, let results = sut.result, results.count > 0 {
            XCTAssert(results.count > 0)
        } else {
            XCTFail("Server call failed because of xyz reasons")
            return
        }
    }
}

extension HomeSceneInteractorTests: HomeSceneDisplayView {
    
    var interactor: HomeSceneBusinessLogic? {
         sut
    }
    
    var router: HomeSceneRoutingLogic? {
        nil
    }
    
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        expectation.fulfill()
    }
    
    func failedToFetchCharacters(error: Error) {
        expectation.fulfill()
    }
}

