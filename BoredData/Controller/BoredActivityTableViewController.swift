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
    var fetchResultsController: NSFetchedResultsController<BoredActivity>?
    var activityObjects: [BoredActivity] = []
    var delegate: ActivityDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let activityFetch = NSFetchRequest<BoredActivity>(entityName: "BoredActivity")
        
        activityFetch.sortDescriptors = [ NSSortDescriptor(key: "accessibility", ascending: true) ]
        
        fetchResultsController = NSFetchedResultsController<BoredActivity> (fetchRequest: activityFetch, managedObjectContext: managedContext!, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchResultsController?.delegate = self
        
        do {
            try fetchResultsController?.performFetch()
            activityObjects = fetchResultsController!.fetchedObjects!
            
        } catch {
            print("Error getting activity \(error)")
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityObjects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let activity = activityObjects[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell")!
        cell.textLabel?.text = activity.activity
        return cell
    }
    
}
