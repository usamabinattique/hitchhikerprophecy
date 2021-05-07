//
//  String.swift
//  The Hitchhiker Prophecy
//
//  Created by usama on 05/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import CryptoKit

extension String {
    var hashValue: String {
        Insecure.MD5.hash(data: self.data(using: .utf8)!).map { String(format: "%02hhx", $0) }.joined()
    }
}

