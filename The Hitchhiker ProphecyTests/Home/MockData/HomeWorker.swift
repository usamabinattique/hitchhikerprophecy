//
//  HomeWorker.swift
//  The Hitchhiker ProphecyTests
//
//  Created by usama on 09/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
@testable import The_Hitchhiker_Prophecy

class HomeWorker: HomeWorkerType {
    
    var networkCompletion: ((HomeScene.Search.Response) -> Void)?

    
    func getCharacters(_ input: Characters.Search.Input, completion: @escaping (HomeScene.Search.Response) -> Void) {
        networkCompletion = completion
    }
}
