//
//  Optional+Extension.swift
//  The Hitchhiker Prophecy
//
//  Created by usama on 07/05/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation

extension Optional {

   var isNil: Bool {
       guard case Optional.none = self else {
           return false
       }
       return true
   }
}
