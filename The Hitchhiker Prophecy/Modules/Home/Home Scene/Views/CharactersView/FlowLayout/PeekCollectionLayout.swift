//
//  PeekCollectionLayout.swift
//  The Hitchhiker Prophecy
//
//  Created by usama on 09/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

class PeekCollectionLayout: UICollectionViewFlowLayout {

    private var width: CGFloat!
    private var height: CGFloat!
    private let scaleFactor: CGFloat = 0.82
    
    override init() {
        super.init()
        scrollDirection = .horizontal
        minimumInteritemSpacing = 20
        minimumLineSpacing = 20
        sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 5, right: 20)
        width = UIScreen.main.bounds.width * scaleFactor
        height = UIScreen.main.bounds.height * scaleFactor
        itemSize = CGSize(width: width, height: height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
