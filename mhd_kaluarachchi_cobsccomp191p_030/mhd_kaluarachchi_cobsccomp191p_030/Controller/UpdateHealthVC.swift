//
//  UpdateHealthVC.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/17/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import Foundation
import UIKit

class UpdateHealthVC: UIViewController{
    
    @IBOutlet weak var loginRequestView: UIView!
    
    @IBOutlet weak var NewNotificationButton: UIButton!
    
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
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
