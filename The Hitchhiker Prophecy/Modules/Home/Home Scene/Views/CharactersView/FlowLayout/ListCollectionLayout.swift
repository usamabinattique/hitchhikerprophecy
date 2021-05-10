//
//  ListCollectionLayout.swift
//  The Hitchhiker Prophecy
//
//  Created by usama on 09/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

class ListCollectionLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        scrollDirection = .vertical
        minimumInteritemSpacing = 15
        minimumLineSpacing = 15
        sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(collectionView: UIView) {
        self.init()
        itemSize = CGSize(width: collectionView.frame.width * 0.9, height: collectionView.frame.height * 0.27)
    }
}
