//
//  ViewController.swift
//  BoredData
//
//  Created by Cara on 4/21/19.
//  Copyright © 2019 Cara. All rights reserved.
//

import UIKit
import CoreData

class BoredActivityViewController: UIViewController, ActivityDelegate {
    
    let activityFetcher = ActivityService()
    var managedContext: NSManagedObjectContext?
   
    
    @IBOutlet var activityTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityFetcher.activityDelegate = self
        activityFetcher.fetchRandomActivity()
    }
    @IBAction func newActivityTapped(_ sender: Any) {
        activityFetcher.fetchRandomActivity()
    }
    
    func activityFetched(activity: BoredActivity) {
        DispatchQueue.main.async {
            let activityText = "\(activity.activity!)"
            self.activityTextView.text = activityText
        }
    }
    
    func activityFetchError(because activityError: ActivityError) {
        let alert = UIAlertController(title: "Error", message: "Error getting activity. \(activityError.message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    @IBAction func activityListTapped(_ sender: Any) {
        performSegue(withIdentifier: "activityList", sender: sender)
        
    }
    
    @IBAction func saveActivity(_ sender: Any) {
    
        // This should save an Activity to CoreData
        // use the managedContext to save
        
        do { try managedContext!.save() }
        catch { print("Error saving") }
        performSegue(withIdentifier: "saveActivity", sender: sender)
        // this should segue to the next scene
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let tableViewController = segue.destination as! BoredActivityTableViewController
            tableViewController.delegate = self
    }
    
    
    

    


}

