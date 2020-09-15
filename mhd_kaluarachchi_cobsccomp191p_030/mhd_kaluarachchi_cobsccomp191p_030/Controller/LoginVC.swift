//
//  LoginVC.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/14/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import Foundation
import UIKit

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
        
        if isValidEmail(emailID: email) == false {
            errorLabel.isHidden = false
            EmailAddress.text=""
            errorLabel.text = "Please enter valid email address"
        }else{
            errorLabel.isHidden=true
            
            //login comes here
        }
        
        
    }
    //emailvalidationfunction
    func isValidEmail(emailID:String) -> Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
           let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailTest.evaluate(with: emailID)
       }
    
    @IBAction func goBackToRegister(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
