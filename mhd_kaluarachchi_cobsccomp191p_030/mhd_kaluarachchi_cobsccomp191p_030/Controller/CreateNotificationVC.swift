//
//  CreateNotificationVC.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/17/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseAuth

class CreateNotificationVC: UIViewController{
    
    @IBOutlet weak var NotifTopic: UITextField!
    
    @IBOutlet weak var NotifSummary: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.isHidden=true
   
    }
    @IBAction func publishNotification(_ sender: Any) {
        
        //validation
        
        //create
        let userdata = Auth.auth().currentUser!.uid
        let db = Firestore.firestore()
        //get current date
        let formatter : DateFormatter = DateFormatter()
        formatter.dateFormat = "d/M/yy"
        let notifDate : String = formatter.string(from:   NSDate.init(timeIntervalSinceNow: 0) as Date)
        
        
        
        db.collection("notifications").addDocument(data: ["notiftopic":NotifTopic.text!, "notif":NotifSummary.text!,"notifdate":notifDate, "uid": userdata ]) { (error) in
            
            if error != nil {
                // Show error message
                self.errorLabel.isHidden=false
                self.errorLabel.text="Unexpected error occured"
            }
        }
    }
    
    @IBAction func discardPost(_ sender: Any) {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
