//
//  CharactersView.swift
//  The Hitchhiker Prophecy
//
//  Created by usama on 07/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

class CharactersView: UIView {
    
    var collectionView: UICollectionView!
    private var characters: [HomeScene.Search.ViewModel] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CharactersView {
    func setupUI() {
        collectionView = UICollectionView()
        collectionView.dataSource = self
        collectionView.withConstraints { view in
            view.alignEdges()
        }
        
        addSubview(collectionView)
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

extension CharactersView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
