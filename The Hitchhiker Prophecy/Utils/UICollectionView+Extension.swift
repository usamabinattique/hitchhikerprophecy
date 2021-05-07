//
//  ReusableView.swift
//  The Hitchhiker Prophecy
//
//  Created by usama on 07/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

/// Make `UICollectionViewCell` reusable cell.
extension UICollectionViewCell: ReusableCell { }

extension UICollectionView {

    public func registerNib(cellNib cell: ReusableCell.Type, in bundle: Bundle? = nil) {
        let nib = UINib(nibName: cell.NibName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: cell.ReuseId)
    }
    
    func registerNibs(cells: [ReusableCell.Type], in bundle: Bundle? = nil) {
        cells.forEach { registerNib(cellNib: $0) }
    }

    public func registerClass(cellClass cell: ReusableCell.Type) {
        register(cell, forCellWithReuseIdentifier: cell.ReuseId)
    }

    func dequeueReusableCell<T: ReusableCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.ReuseId, for: indexPath ) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.ReuseId)")
        }
        return cell
    }

    var visibleCurrentCellIndexPath: IndexPath? {
        for cell in self.visibleCells {
            let indexPath = self.indexPath(for: cell)
            return indexPath
        }
        return nil
    }
}
