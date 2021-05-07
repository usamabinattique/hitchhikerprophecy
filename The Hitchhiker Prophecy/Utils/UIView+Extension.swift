//
//  UIView+Extension.swift
//  The Hitchhiker Prophecy
//
//  Created by usama on 07/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

extension UIView {
    
    @discardableResult
    func withConstraints(_ closure: (_ view: UIView) -> [NSLayoutConstraint]) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(closure(self))
        return self
    }
    
    // Layout guide
    func alignLeading(_ layoutGuide: UILayoutGuide, constant: CGFloat = 0) -> NSLayoutConstraint {
        leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: constant)
    }

    func alignTrailing(_ layoutGuide: UILayoutGuide, constant: CGFloat = 0) -> NSLayoutConstraint {
        trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: constant)
    }

    func alignLeft(_ layoutGuide: UILayoutGuide, constant: CGFloat = 0) -> NSLayoutConstraint {
        leftAnchor.constraint(equalTo: layoutGuide.leftAnchor, constant: constant)
    }

    func alignRight(_ layoutGuide: UILayoutGuide, constant: CGFloat = 0) -> NSLayoutConstraint {
        rightAnchor.constraint(equalTo: layoutGuide.rightAnchor, constant: constant)
    }

    func alignAny(_ fromXAxisAnchor: NSLayoutXAxisAnchor, toXAxisAnchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> NSLayoutConstraint {
        fromXAxisAnchor.constraint(equalTo: toXAxisAnchor, constant: constant)
    }

    func alignTop(_ layoutGuide: UILayoutGuide, constant: CGFloat = 0) -> NSLayoutConstraint {
        topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: constant)
    }

    func alignBottom(_ layoutGuide: UILayoutGuide, constant: CGFloat = 0) -> NSLayoutConstraint {
        bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: constant)
    }
    
    private func anchorView(_ view: UIView?) -> UIView {
        return view ?? superview!
    }
    
    // View
    func alignLeading(_ view: UIView? = nil, constant: CGFloat = 0) -> NSLayoutConstraint {
        leadingAnchor.constraint(equalTo: anchorView(view).leadingAnchor, constant: constant)
    }

    func alignTrailing(_ view: UIView? = nil, constant: CGFloat = 0) -> NSLayoutConstraint {
        trailingAnchor.constraint(equalTo: anchorView(view).trailingAnchor, constant: constant)
    }

    func alignLeft(_ view: UIView? = nil, constant: CGFloat = 0) -> NSLayoutConstraint {
        leftAnchor.constraint(equalTo: anchorView(view).leftAnchor, constant: constant)
    }

    func alignRight(_ view: UIView? = nil, constant: CGFloat = 0) -> NSLayoutConstraint {
        rightAnchor.constraint(equalTo: anchorView(view).rightAnchor, constant: constant)
    }

    func alignTop(_ view: UIView? = nil, constant: CGFloat = 0) -> NSLayoutConstraint {
        topAnchor.constraint(equalTo: anchorView(view).topAnchor, constant: constant)
    }

    func alignBottom(_ view: UIView? = nil, constant: CGFloat = 0) -> NSLayoutConstraint {
        bottomAnchor.constraint(equalTo: anchorView(view).bottomAnchor, constant: constant)
    }
    
    func alignEdges(_ view: UIView? = nil, insets: UIEdgeInsets = UIEdgeInsets.init()) -> [NSLayoutConstraint] {
        return [
            alignLeft(view, constant: insets.left),
            alignRight(view, constant: -insets.right),
            alignTop(view, constant: insets.top),
            alignBottom(view, constant: -insets.bottom)
        ]
    }
}


