//
//  HomeSceneViewController.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class HomeSceneViewController: UIViewController {
    
    // MARK: - Properties
    var interactor: HomeSceneBusinessLogic?
    var router: HomeSceneRoutingLogic?
    
    
    var charactersView: CharactersView!
    var activityIndicator: UIActivityIndicatorView!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchCharacters()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

private extension HomeSceneViewController {
    func fetchCharacters() {
        activityIndicator.startAnimating()
        interactor?.fetchCharacters()
    }
}

extension HomeSceneViewController: HomeSceneDisplayView {
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        charactersView.updateCharacters(characters: viewModel)
    }
    
    func failedToFetchCharacters(error: Error) {
        activityIndicator.stopAnimating()
        displayAlert(error: error)
    }
}

   //MARK: UI Helper Methods
private extension HomeSceneViewController {
    
    func setupUI() {
        setupNavigationItem()
        setupActivityIndicator()
        setupCharactersView()
    }
    
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
    
    func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.color = .white
        view.addSubview(activityIndicator)
        
        activityIndicator.withConstraints { view in
            view.alignCenter()
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

private extension HomeSceneViewController {
    
    func displayAlert(error: Error){
        let alert = UIAlertController( title: "Error",
                                       message: error.localizedDescription,
                                       preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Retry",
                                      style: .default)
        { _ in
            self.fetchCharacters()
        })
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .destructive,
                                      handler: nil))
        
        present(alert, animated: true, completion: nil)
        
    }
}
