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
        
        if isValidEmail(emailID: email) == false{
            errorLabel.isHidden = false
            EmailAddress.text=""
            errorLabel.text = "Please enter valid email address"
            status=false
        }
        if isPasswordValid(password: password) == false{
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
                self.errorLabel.text = "Invalid credentials"
            }
            
        }
            
        }
        
        
    }
    //emailvalidationfunction
    func isValidEmail(emailID:String) -> Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
           let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailTest.evaluate(with: emailID)
       }
    
    func isPasswordValid(password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    @IBAction func goBackToRegister(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
