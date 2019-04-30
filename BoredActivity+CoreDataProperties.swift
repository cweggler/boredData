//
//  BoredActivity+CoreDataProperties.swift
//  BoredData
//
//  Created by Cara on 4/29/19.
//  Copyright © 2019 Cara. All rights reserved.
//
//

import Foundation
import CoreData


extension BoredActivity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BoredActivity> {
        return NSFetchRequest<BoredActivity>(entityName: "BoredActivity")
    }

    @NSManaged public var accessibility: Double
    @NSManaged public var activity: String?
    @NSManaged public var participants: Int16
    @NSManaged public var price: Double
    @NSManaged public var type: String?

}
