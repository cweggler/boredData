//
//  ActivityDelegate.swift
//  BoredData
//
//  Created by Cara on 4/22/19.
//  Copyright © 2019 Cara. All rights reserved.
//

import Foundation

protocol ActivityDelegate {
    func activityFetched(activity: Activity)
    func activityFetchError(because activityError: ActivityError)
}
