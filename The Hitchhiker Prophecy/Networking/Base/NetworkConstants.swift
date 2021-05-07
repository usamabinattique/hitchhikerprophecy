//
//  NetworkConstants.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

enum NetworkConstants {
    static let baseUrl = "https://gateway.marvel.com"
    static let publicKey = "4526fecf17a824a6309c0cb1d6cc4576"
    static let privateKey = "61c71686185c084b4c0383827c801b0389930cf5"
    static let timeStamp = String(describing: Date().timeIntervalSince1970)
    static let apiHash = String(format: "%@%@%@", arguments: [timeStamp, privateKey, publicKey]).hashValue

}
