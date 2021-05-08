//
//  HomeSceneViewController.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

enum Layout {
    case cards
    case list
}

class HomeSceneViewController: UIViewController {
    
    // MARK: - Properties
    var interactor: HomeSceneBusinessLogic?
    var router: HomeSceneRoutingLogic?
    var charactersView: CharactersView!
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    private var layout: Layout = .list

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchCharacters()
        setupNavigationItem()
        setupCharactersView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
     
    
    // MARK: -

}

extension HomeSceneViewController: HomeSceneDisplayView {
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        charactersView.updateCharacters(characters: viewModel)
    }
    
    func failedToFetchCharacters(error: Error) {
        
        
    }
}

extension HomeSceneViewController {
    func setupCharactersView() {
        
        charactersView = CharactersView(router: router)
        charactersView.backgroundColor = .clear
        view.addSubview(charactersView)
        
        charactersView.withConstraints { view in
            [ view.alignTop(self.view.safeAreaLayoutGuide, constant: 0),
              charactersView.alignLeading(),
              charactersView.alignTrailing(),
              charactersView.alignBottom()]
        }
    }
    
    func setupNavigationItem() {
        let button = UIBarButtonItem(title: "Change Layout", style: .plain, target: self, action: #selector(changeLayoutTapped))
        navigationItem.rightBarButtonItem = button
    }
    
    /// Collection View Layout Action
    @objc func changeLayoutTapped(_ sender: Any) {
        charactersView.toggleList()
    }
}
