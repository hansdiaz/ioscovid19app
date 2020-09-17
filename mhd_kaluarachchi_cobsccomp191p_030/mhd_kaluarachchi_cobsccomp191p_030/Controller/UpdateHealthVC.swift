//
//  UpdateHealthVC.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/17/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore

class UpdateHealthVC: UIViewController{
    
    @IBOutlet weak var loginRequestView: UIView!
    
    @IBOutlet weak var NewNotificationButton: UIButton!
    
    @IBOutlet weak var updatedDate: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var BodyTemp: UITextField!
    
    var documentIdString=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(User.userLogStatus==false)
        {
            self.loginRequestView.isHidden=false
        }
        else if(User.userLogStatus==true)
        {
            self.loginRequestView.isHidden=true
        }
        if(User.userType=="Academic Staff")
        {
            self.NewNotificationButton.isHidden=false
        }else{
            self.NewNotificationButton.isHidden=true
        }
        
        //setting the data for labels
        let userdata = Auth.auth().currentUser!.uid
        print(userdata)
        //get user type from firestore
        
        // Create a reference to the cities collection
        let db = Firestore.firestore()
        var temp=""
        var tempdate=""
        db.collection("users").whereField("uid", isEqualTo: userdata).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
                    let documentData = document.data()
                    temp = documentData["temp"]! as! String
                    tempdate = documentData["tempdate"]! as! String
                    self.tempLabel.text=temp
                    self.updatedDate.text=tempdate
                    self.documentIdString=document.documentID
            }
          }
        }
        
    }
    @IBAction func updateTemperature(_ sender: Any) {
        //validation
        
        
        //get current date
        let formatter : DateFormatter = DateFormatter()
        formatter.dateFormat = "d/M/yy"
        let tempDate : String = formatter.string(from:   NSDate.init(timeIntervalSinceNow: 0) as Date)
        
        //update query
        let db = Firestore.firestore()
        db.collection("users").document(documentIdString).setData(["temp":BodyTemp.text,"tempdate":tempDate], merge:true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
