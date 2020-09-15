//
//  surveyVC.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/15/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import Foundation
import UIKit

class SurveyScreen1: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    @IBAction func s1No(_ sender: Any) {
        
    let storyboard = UIStoryboard(name: "Main.storyboard", bundle: nil)
    let linkingVC = storyboard.instantiateViewController(withIdentifier: "SurveyScreen2")
    self.navigationController?.pushViewController(linkingVC, animated: true)
    }
    
    
    @IBAction func s1Yes(_ sender: Any) {
    }
    
    
    @IBAction func sCancel(_ sender: Any) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
