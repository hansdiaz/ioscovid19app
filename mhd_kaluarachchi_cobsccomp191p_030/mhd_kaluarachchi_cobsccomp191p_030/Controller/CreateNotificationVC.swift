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
import Firebase

class CreateNotificationVC: UIViewController{
    
    @IBOutlet weak var NotifTopic: UITextField!
    
    @IBOutlet weak var NotifSummary: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.isHidden=true
   
    }
    
   
    
    @IBAction func publishNotification(_ sender: Any) {
        var proceedStatus=true
        //validation
        guard let notifTopic = NotifTopic.text, NotifTopic.text?.count != 0  else {
            errorLabel.isHidden = false
            errorLabel.text = "Please fill all details"
            proceedStatus=false
            return
        }
        
        guard let notifSummary = NotifSummary.text, NotifSummary.text?.count != 0  else {
            errorLabel.isHidden = false
            errorLabel.text = "Please fill all details"
            proceedStatus=false
            return
        }
        
        
        //create
        let userdata = Auth.auth().currentUser!.uid
        let db = Firestore.firestore()
        //get current date
        let formatter : DateFormatter = DateFormatter()
        formatter.dateFormat = "d/M/yy"
        let notifDate : String = formatter.string(from:   NSDate.init(timeIntervalSinceNow: 0) as Date)
        
        
        
        
        //update document of NOTIFICATION collection
        db.collection("notification").document("update").setData([
                    "notiftopic": notifTopic,
                    "notifsummary": notifSummary,
                    "notifdate": notifDate,
                    "uid": userdata
                    
                ]) { (error) in
                    
                    if error != nil {
                        // Show error message
                        self.errorLabel.isHidden=false
                        self.errorLabel.text="Unexpected error occured"
                    }
                    if proceedStatus==true{
                        self.performSegue(withIdentifier: "publishandgohome", sender: nil)
                    }
        }
        
        //code for publishing to the real time firebase for viewing purpose
        let rtDBRef = Database.database().reference()
        let notificationData = [
            "title" : notifTopic,
            "content" : notifSummary,
            "date" : notifDate
        ]
        
        rtDBRef.child("notifications").child(rtDBRef.child("notifications").childByAutoId().key ?? "defaultkey").setValue(notificationData) {
            (error: Error?, ref:DatabaseReference) in
            if let error = error {
                print("Data not saved : " + error.localizedDescription)
            } else {
                print("Data saved")
            }
        }
    }
    
    @IBAction func discardPost(_ sender: Any) {
       
        var status1=true
        var status2=true
        if(NotifTopic.text==""){
            status1=false
        }
        if(NotifSummary.text==""){
            status2=false
        }
        if(status1==true || status2==true){
            let alert = UIAlertController(title: "Discard Post?", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Don't", style: .cancel, handler: nil))

            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                //logic
                self.performSegue(withIdentifier: "publishandgohome", sender: nil)
                
            }))
            self.present(alert, animated: true)
            
        }
        else{
            self.performSegue(withIdentifier: "publishandgohome", sender: nil)
        }
        
    }
    
   
     

     
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
