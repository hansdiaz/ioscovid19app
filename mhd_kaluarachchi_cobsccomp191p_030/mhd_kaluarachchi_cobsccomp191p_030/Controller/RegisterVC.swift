//
//  ViewController.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/13/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit
import Foundation

import Firebase
import FirebaseAuth
import FirebaseFirestore



class RegisterVC: UIViewController{
    
    private let dataSource = ["Student","Academic Staff","Non Academic Staff"]

    @IBOutlet weak var userPicker: UIPickerView!
    
    @IBOutlet weak var FirstName: UITextField!
    
    @IBOutlet weak var LastName: UITextField!
    
    @IBOutlet weak var EmailAddress: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var formStackView: UIStackView!
    
    var userType=""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.passwordLabel.isHidden=true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false;
        
        self.scrollView.addSubview(formStackView)
        
        self.formStackView.translatesAutoresizingMaskIntoConstraints=false
        
        self.formStackView.alignment = .fill
        self.formStackView.distribution = .fillProportionally
        formStackView.axis = .vertical
        formStackView.spacing = 10.0
        
        self.formStackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor,constant: 20).isActive=true
        self.formStackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor,constant: 20).isActive=true
        
        self.formStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor,constant: 50).isActive=true
        self.formStackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive=true
        
        formStackView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        
        
        //self.formStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive=true
        
        // Do any additional setup after loading the view.
        userPicker.delegate=self
        userPicker.dataSource=self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func createNow(_ sender: Any) {
        var status=true
        guard let fName = FirstName.text, FirstName.text?.count != 0  else {
            passwordLabel.isHidden = false
            passwordLabel.text = "Please fill all details"
            return
        }
        
        guard let lName = LastName.text, LastName.text?.count != 0  else {
            passwordLabel.isHidden = false
            passwordLabel.text = "Please fill all details"
            return
        }
        
        guard let email = EmailAddress.text, EmailAddress.text?.count != 0  else {
            passwordLabel.isHidden = false
            passwordLabel.text = "Please fill all details"
            return
        }
        
        guard let password = Password.text, Password.text?.count != 0  else {
            passwordLabel.isHidden = false
            passwordLabel.text = "Please fill all details"
            return
        }
        
        if Regex.isValidEmail(emailID: email) == false {
            passwordLabel.isHidden = false
            EmailAddress.text=""
            passwordLabel.text = "Please enter valid email address"
            status=false
        }
        if Regex.isPasswordValid(password:password)==false{
            passwordLabel.isHidden = false
            Password.text=""
            passwordLabel.text = "Password must be 8 letters including Caps and signs"
            status=false
        }
        if (userType == "") {
            userType="Student"
        }
        
        if(status==true){
            
            //

            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.passwordLabel.isHidden=false
                    self.passwordLabel.text="Error: Try out a different email"
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    //get current date
                    let formatter : DateFormatter = DateFormatter()
                    formatter.dateFormat = "d/M/yy"
                    let regDate : String = formatter.string(from:   NSDate.init(timeIntervalSinceNow: 0) as Date)
                    
                    
                    
                    db.collection("users").addDocument(data: ["firstname":fName, "lastname":lName,"type":self.userType,"regdate":regDate,"index":"","country":"", "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.passwordLabel.isHidden=true
                            self.passwordLabel.text="Unexpected error occured"
                        }
                        User.userType=self.userType  //adding data at registration the user type
                    }
                    
                    if Auth.auth().currentUser?.uid != nil {
                        User.userLogStatus=true
                        print("log status is true++++++++++++++++++++++++++++++++++++++++++++++++at REg")
                        
                    } else {
                       User.userLogStatus=false
                        print("log status is false++++++++++++++++++++++++++++++++++++++++++++++++++++++++++at Reg")
                    }
                    
                    self.performSegue(withIdentifier: "registerToHome", sender: nil)
                }
                
            }

            
        }
    }

    

}


extension RegisterVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count}
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return self.userType=dataSource[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
}

