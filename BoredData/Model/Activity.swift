//
//  Activity.swift
//  BoredData
//
//  Created by Cara on 4/21/19.
//  Copyright © 2019 Cara. All rights reserved.
//

import Foundation

struct Activity: Decodable {
    
    let activity: String
    let accessibility: Double
    let type: String
    let participants: Int
    let price: Double
}
