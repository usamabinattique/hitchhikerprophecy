//
//  HomeMockInteractor.swift
//  The Hitchhiker ProphecyTests
//
//  Created by usama on 10/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class HomeMockInteractor: HomeSceneDataStore, HomeSceneBusinessLogic {
    var result: Characters.Search.Results?

    var worker: HomeWorkerType
    var presenter: HomeScenePresentationLogic
    var fileName = "ServerResponse"
    
    init(worker: HomeWorkerType, presenter: HomeScenePresentationLogic) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func fetchCharacters() {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            self.presenter.presentCharacters(.failure(.cannotParseResponse))
            return
        }
        let data = try? Data(contentsOf: URL(fileURLWithPath: path))
        if let json = try? JSONDecoder().decode(Characters.Search.Output.self, from: data ?? Data()) {
            let response: HomeScene.Search.Response = .success(json)
            self.presenter.presentCharacters(response)
        } else {
            self.presenter.presentCharacters(.failure(.cannotParseResponse))
        }
    }
}
