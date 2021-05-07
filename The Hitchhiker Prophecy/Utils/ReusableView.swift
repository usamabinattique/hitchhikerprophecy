//
//  ReusableView.swift
//  The Hitchhiker Prophecy
//
//  Created by usama on 07/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation

@objc public protocol ReusableView { }

extension ReusableView {

    /// Represents a default reuse id. It is the class name as string.
    /// Usually (99.99% of the times) we register the cell once. So a unique name would be the reuse id.
    public static var ReuseId: String {
        return String(describing: self)
    }

    /// Represents a default nib name. It is the class name as string.
    /// Usually (99.99% of the times) we name the nib as the class name.
    public static var NibName: String {
        return String(describing: self)
    }
}

@objc public protocol ReusableCell: ReusableView { }
