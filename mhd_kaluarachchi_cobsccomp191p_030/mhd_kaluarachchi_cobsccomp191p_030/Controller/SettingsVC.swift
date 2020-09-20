//
//  SettingsVC.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/17/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingsVC: UIViewController {
    
    @IBOutlet weak var ProfileUpdateButton: UIButton!
    
    @IBOutlet weak var LogoutButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(User.userLogStatus==false){
            self.ProfileUpdateButton.isHidden=true
            self.LogoutButton.isHidden=true
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func profileUpdate(_ sender: Any) {
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            User.userLogStatus=false
            performSegue(withIdentifier: "logoutToHome", sender: nil)
            
            /*let vc = HomeVC()
            vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
            self.present(vc, animated: true, completion: nil)*/
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            
            let alert = UIAlertController(title: "Signout Error", message: "Sorry we couldnt sign you out, check for connectivity problems", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: nil))

            self.present(alert, animated: true)
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
