//
//  HomeScenePresenter.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class HomeScenePresneter: HomeScenePresentationLogic {
    weak var displayView: HomeSceneDisplayView?
    
    init(displayView: HomeSceneDisplayView) {
        self.displayView = displayView
    }
    
    func presentCharacters(_ response: HomeScene.Search.Response) {
        switch response {
        case let .success(output):
            displayView?.didFetchCharacters(viewModel: output.data.results.map(convertOutputToVM(_:)))
            
        case let .failure(error):
            displayView?.failedToFetchCharacters(error: error)
        }
    }
}

private extension HomeScenePresneter {
    func convertOutputToVM(_ character: Characters.Search.Character) -> HomeScene.Search.ViewModel {
        HomeScene.Search.ViewModel(name: character.name,
                                   desc: character.resultDescription,
                                   imageUrl: imageUrl(thumbanail: character.thumbnail),
                                   comics: character.comics.collectionURI,
                                   series: character.series.collectionURI,
                                   stories: character.stories.collectionURI,
                                   events: character.events.collectionURI)
    }
    
    func imageUrl(thumbanail: Characters.Search.Character.Thumbnail) -> String {
        String(format: "%@.%@", arguments: [thumbanail.path, thumbanail.thumbnailExtension])
    }
}
