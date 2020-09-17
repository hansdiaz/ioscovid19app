//
//  surveyVC.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/15/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import Foundation
import UIKit

class SurveyScreen1VC: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    @IBAction func noClick(_ sender: Any) {
        SurveyData.s1=false
        
        //self.performSegue(withIdentifier: "noS1", sender: nil)
    }
    @IBAction func yesClick(_ sender: Any) {
        SurveyData.s1=true
        print(SurveyData.s1)
        print("s1--------------------------------------------------------------")
        //self.performSegue(withIdentifier: "yesS1", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
