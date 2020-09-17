//
//  SurveyScreen2VC.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/16/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import Foundation
import UIKit

class SurveyScreen2VC: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    @IBAction func noClick(_ sender: Any) {
        SurveyData.s2=false
        //self.performSegue(withIdentifier: "noS2", sender: nil)
    }
    
    @IBAction func yesClick(_ sender: Any) {
        SurveyData.s2=true
        //self.performSegue(withIdentifier: "yesS2", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
