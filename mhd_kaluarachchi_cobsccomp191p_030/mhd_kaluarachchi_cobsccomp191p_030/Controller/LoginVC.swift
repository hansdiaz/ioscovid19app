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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //do aditional setup after here
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signInNow(_ sender: Any) {
    }
    
    @IBAction func goBackToRegister(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
