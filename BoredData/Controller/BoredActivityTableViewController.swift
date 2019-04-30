//
//  BoredActivityTableViewController.swift
//  BoredData
//
//  Created by Cara on 4/22/19.
//  Copyright © 2019 Cara. All rights reserved.
//

import UIKit
import CoreData

class BoredActivityTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var managedContext: NSManagedObjectContext?
    var delegate: ActivityDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sortDescriptor = NSSortDescriptor(key: <#T##String?#>, ascending: <#T##Bool#>)
    }
    
}
