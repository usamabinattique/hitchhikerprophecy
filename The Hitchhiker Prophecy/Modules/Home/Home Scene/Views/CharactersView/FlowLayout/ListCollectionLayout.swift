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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(width: CGFloat, height: CGFloat) {
        self.init()
        scrollDirection = .vertical
        minimumLineSpacing = 15
        sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 5, right: 5)
        itemSize = CGSize(width: width, height: height)
    }
}
