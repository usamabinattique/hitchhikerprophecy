//
//  ListCollectionLayout.swift
//  The Hitchhiker Prophecy
//
//  Created by usama on 09/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

class ListCollectionLayout: UICollectionViewFlowLayout {
    
    private let scaleFactor: CGFloat = 0.25
    private var width: CGFloat!
    override init() {
        super.init()
        scrollDirection = .vertical
        minimumInteritemSpacing = 15
        sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(width: CGFloat, height: CGFloat) {
        self.init()
        self.width = width
        itemSize = CGSize(width: width, height: height)
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView!.bounds.width * scaleFactor, height: collectionView!.bounds.height * scaleFactor)
        
        super.layoutAttributesForElements(in: targetRect)?.forEach {
            let offset = $0.frame.origin.x
            if (abs(offset - proposedContentOffset.x) < abs(offsetAdjustment)) {
                offsetAdjustment = offset - proposedContentOffset.x
            }
        }
        
        return CGPoint(x: proposedContentOffset.x + offsetAdjustment - (UIScreen.main.bounds.width - width) * 0.5, y: proposedContentOffset.y)
    }
}
