//
//  NotificationVC.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/17/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class NotificationVC: UIViewController{
    
    @IBOutlet weak var NotifTopicTextView: UILabel!
    @IBOutlet weak var NotifSummaryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotifSummaryTextView.isScrollEnabled = true
        let db = Firestore.firestore()

        db.collection("notification").document("update").getDocument { (document, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                let documentData=document?.data()
                let notifTopic = documentData?["notiftopic"]! as! String
                let notifSummary = documentData?["notifsummary"]! as! String
                self.NotifTopicTextView.text=notifTopic
                self.NotifSummaryTextView.text=notifSummary
          }
        }
        
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
