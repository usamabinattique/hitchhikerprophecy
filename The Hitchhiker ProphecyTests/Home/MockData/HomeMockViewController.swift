//
//  HomeMockViewController.swift
//  The Hitchhiker ProphecyTests
//
//  Created by usama on 10/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class HomeMockViewController: HomeSceneDisplayView {
    
    var interactor: HomeSceneBusinessLogic?
    var router: HomeSceneRoutingLogic?
    
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        
        if viewModel.count > 0 {
            XCTAssertTrue(viewModel.first?.name == "Hulk")
        } else {
            XCTFail("Unable to setup view model")
            return
        }
    }
    
    func failedToFetchCharacters(error: Error) {
        XCTAssertEqual(error as! NetworkError, NetworkError.cannotParseResponse)
    }
}
