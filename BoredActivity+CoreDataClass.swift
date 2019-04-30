//
//  BoredActivity+CoreDataClass.swift
//  BoredData
//
//  Created by Cara on 4/29/19.
//  Copyright © 2019 Cara. All rights reserved.
//
//

import Foundation
import CoreData

// Extend Decodable so you this class can do double duty, used for fetching the
// API AND for CoreData

@objc(BoredActivity)
public class BoredActivity: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case activity = "activity"
        case accessibility = "howEasy"
        case type = "type"
        case participants = "persons"
        case price = "cost"
    }
    
    required convenience public init(from decoder: Decoder) throws {
        let managedObjectContext = decoder.userInfo[CodingUserInfoKey.context!] as! NSManagedObjectContext
        guard let entity = NSEntityDescription.entity(forEntityName: "BoredActivity", in: managedObjectContext) else { fatalError("No BoredActivity") }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.activity = try container.decodeIfPresent(String.self, forKey: .activity)
        self.accessibility = try container.decodeIfPresent(Double.self, forKey: .accessibility)!
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.participants = try container.decodeIfPresent(Int16.self, forKey: .participants)!
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)!
    }
}
    
    
    extension CodingUserInfoKey {
        static let context = CodingUserInfoKey(rawValue: "context")
    }
        

