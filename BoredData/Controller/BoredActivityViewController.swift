//
//  ViewController.swift
//  BoredData
//
//  Created by Cara on 4/21/19.
//  Copyright © 2019 Cara. All rights reserved.
//

import UIKit

class BoredActivityViewController: UIViewController, ActivityDelegate {
    
    let activityFetcher = ActivityService()
    
    @IBOutlet var activityTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityFetcher.activityDelegate = self
        activityFetcher.fetchRandomActivity()
    }
    @IBAction func newActivityTapped(_ sender: Any) {
        activityFetcher.fetchRandomActivity()
    }
    
    func activityFetched(activity: Activity) {
        DispatchQueue.main.async {
            let activityText = "\(activity.activity)"
            self.activityTextView.text = activityText
        }
    }
    
    func activityFetchError(because activityError: ActivityError) {
        let alert = UIAlertController(title: "Error", message: "Error getting activity. \(activityError.message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    @IBAction func activityListTapped(_ sender: Any) {
        // this should segue to the next scene
    }
    
    

    


}

