//
//  LoginVC.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/14/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class LoginVC:UIViewController{
    
    @IBOutlet weak var EmailAddress: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    //@IBOutlet weak var scrollView: UIScrollView!
    
    //@IBOutlet var formStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.isHidden=true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signInNow(_ sender: Any) {
        var status=true
        guard let email = EmailAddress.text, EmailAddress.text?.count != 0  else {
            errorLabel.isHidden = false
            errorLabel.text = "Please fill all details"
            return
        }
        
        guard let password = Password.text, Password.text?.count != 0  else {
            errorLabel.isHidden = false
            errorLabel.text = "Please fill all details"
            return
        }
        
        if Regex.isValidEmail(emailID: email) == false{
            errorLabel.isHidden = false
            EmailAddress.text=""
            errorLabel.text = "Please enter valid email address"
            status=false
        }
        if Regex.isPasswordValid(password: password) == false{
            errorLabel.isHidden = false
            Password.text=""
            errorLabel.text = "Password must be 8 letters including Caps and signs"
            status=false
        }
        
        if(status==true){
            errorLabel.isHidden=true
            
              // Signing in the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorLabel.isHidden=false
                self.errorLabel.text = "Invalid credentials"
                User.userLogStatus=false
                print("User login unsuccessful")
                print(User.userLogStatus)
            }else{
                User.userLogStatus=true
                print("User logged in successfully")
                print(User.userLogStatus)
                //get user type
                
                
                
                let db = Firestore.firestore()
                let userdata = Auth.auth().currentUser!.uid  //getting user id
                db.collection("users").whereField("uid", isEqualTo: userdata).getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                            let documentData = document.data()
                            let typedata = documentData["type"]! as! String
                            print(typedata)
                            User.userType=typedata
                            self.performSegue(withIdentifier: "loginToHome", sender: nil)
                    }
                  }
                }
                
            }
        }
            
        }
        
        
    }
   
}
