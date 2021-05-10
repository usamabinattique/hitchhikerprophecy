//
//  String+Extension.swift
//  The Hitchhiker Prophecy
//
//  Created by usama on 07/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import CryptoKit

extension String {
    var hashValue: Self {
       Insecure.MD5.hash(data: data(using: .utf8)!).map { String(format: "%02hhx", $0) }.joined()
    }
}

