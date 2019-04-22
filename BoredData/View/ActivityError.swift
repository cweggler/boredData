//
//  ActivityError.swift
//  BoredData
//
//  Created by Cara on 4/22/19.
//  Copyright © 2019 Cara. All rights reserved.
//

import Foundation

class ActivityError: Error {
    let message: String
    
    init(message: String) {
        self.message = message
    }
}
