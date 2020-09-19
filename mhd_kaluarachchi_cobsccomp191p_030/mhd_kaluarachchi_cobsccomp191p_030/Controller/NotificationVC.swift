//
//  NotificationVC.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/17/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import Foundation
import UIKit

class NotificationVC: UIViewController{
    
    @IBOutlet weak var NotifSummaryTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotifSummaryTextView.isScrollEnabled = true
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
