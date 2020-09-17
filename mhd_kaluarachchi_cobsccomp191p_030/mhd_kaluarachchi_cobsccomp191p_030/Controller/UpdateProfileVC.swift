//
//  UpdateProfileVC.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/17/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore

class UpdateProfileVC: UIViewController{
    
    @IBOutlet weak var FirstNameText: UITextField!
    
    @IBOutlet weak var LastNameText: UITextField!
    
    @IBOutlet weak var IndexText: UITextField!
    
    @IBOutlet weak var CountryPicker: UIPickerView!
    private let dataSource = ["Sri Lanka","United Kingdom"]
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    var country=""
    
    var documentIdString=""  //this is kept for updating the user collection document
    
    var index=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IndexText.isHidden=true
        
        if(User.userType=="Student"){
            IndexText.isHidden=false
        }
        
        ErrorLabel.isHidden = true
        
        CountryPicker.delegate=self
        CountryPicker.dataSource=self
        
        //setting the data for textfields
        let userdata = Auth.auth().currentUser!.uid
        print(userdata)
        //get user type from firestore
        
        // Create a reference to the cities collection
        let db = Firestore.firestore()
        var userFirstName=""
        var userLastName=""
        var userIndex=""
        db.collection("users").whereField("uid", isEqualTo: userdata).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
                    let documentData = document.data()
                    userFirstName = documentData["firstname"]! as! String
                    userLastName = documentData["lastname"]! as! String
                    userIndex = documentData["index"]! as! String
                    self.FirstNameText.text=userFirstName
                    self.LastNameText.text=userLastName
                    self.IndexText.text=userIndex
                    self.documentIdString=document.documentID
            }
          }
        }
        
        
   
    }
    
    @IBAction func updateNow(_ sender: Any) {
        guard let fName = FirstNameText.text, FirstNameText.text?.count != 0  else {
            ErrorLabel.isHidden = false
            ErrorLabel.text = "Please fill all details"
            return
        }
        
        guard let lName = LastNameText.text, LastNameText.text?.count != 0  else {
            ErrorLabel.isHidden = false
            ErrorLabel.text = "Please fill all details"
            return
        }
       
        if(User.userType=="Student"){
                if (IndexText.text?.count == 0) {
                ErrorLabel.isHidden = false
                ErrorLabel.text = "Please fill all details"
                return
            }
        }else if(User.userType=="Academic Staff"){
            index=""
        }else if(User.userType=="Non Academic Staff"){
            index=""
        }
        
        if (country == "") {
            country="Sri Lanka"
        }
        ErrorLabel.isHidden=true
        
        //update query
        let db = Firestore.firestore()
        db.collection("users").document(documentIdString).setData(["firstname":fName,"lastname":lName,"index":IndexText.text,"country":country], merge:true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension UpdateProfileVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count}
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return self.country=dataSource[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
}