//
//  SurveyScreen3VC.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/16/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import Foundation
import UIKit

class SurveyScreen3VC: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    @IBAction func noClick(_ sender: Any) {
        SurveyData.s3=false
        //self.performSegue(withIdentifier: "noS3", sender: nil)
    }
    
    
    @IBAction func yesClick(_ sender: Any) {
        SurveyData.s3=true
        //self.performSegue(withIdentifier: "yesS3", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
