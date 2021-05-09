//
//  CharactersView.swift
//  The Hitchhiker Prophecy
//
//  Created by usama on 07/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

class CharactersView: UIView {
    
    // MARK: Properties

    var selectedLayout = HomeScene.LayoutType.peek
    var collectionView: UICollectionView!
    
    private var characters: [HomeScene.Search.ViewModel] = []
    private var router: HomeSceneRoutingLogic?

    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(router: HomeSceneRoutingLogic?) {
        self.init()
        self.router = router
    }
}

 private extension CharactersView {
    func setupUI() {
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: PeekCollectionLayout())
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.registerNib(cellNib: HomeCharacterCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.withConstraints { view in
            view.alignEdges()
        }
    }
}

extension CharactersView {
    public func updateCharacters(characters: [HomeScene.Search.ViewModel]) {
        self.characters = characters
        collectionView.reloadData()
    }
    
    public func toggleList() {
        
        /// original implementation for toggling layout
//                collectionView.setCollectionViewLayout( collectionView.collectionViewLayout is PeekCollectionLayout ? ListCollectionLayout(width: collectionView.frame.width * 0.9, height: collectionView.frame.height * 0.25) : PeekCollectionLayout(),
//                                                        animated: true)
        
        // switch is added for syntatic sugar
        switch collectionView.collectionViewLayout {
        case is PeekCollectionLayout:
            collectionView.setCollectionViewLayout(ListCollectionLayout(width: collectionView.frame.width * 0.95,
                                                                        height: collectionView.frame.height * 0.27), animated: true)
        case is ListCollectionLayout:
            collectionView.setCollectionViewLayout(PeekCollectionLayout(), animated: true)
        default:
            break
        }
        
        collectionView.reloadData()
    }
}

extension CharactersView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCharacterCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(with: characters[indexPath.row])
        return cell
        
    }
}

/// UICollection View Delegate
extension CharactersView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router?.routeToCharacterDetailsWithCharacter(at: indexPath.row)
    }
}
