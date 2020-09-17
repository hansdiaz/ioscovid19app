//
//  UpdateProfileVC.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/17/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import Foundation
import UIKit

class UpdateProfileVC: UIViewController{
    
    @IBOutlet weak var FirstNameText: UITextField!
    
    @IBOutlet weak var LastNameText: UITextField!
    
    @IBOutlet weak var IndexText: UITextField!
    
    @IBOutlet weak var CountryPicker: UIPickerView!
    private let dataSource = ["Sri Lanka","United Kingdom"]
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    var country=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ErrorLabel.isHidden = true
        
        CountryPicker.delegate=self
        CountryPicker.dataSource=self
   
    }
    
    @IBAction func updateNow(_ sender: Any) {
        guard let fName = FirstNameText.text, FirstNameText.text?.count != 0  else {
            ErrorLabel.isHidden = false
            ErrorLabel.text = "Please fill all details"
            return
        }
        
        guard let lName = LastNameText.text, LastNameText.text?.count != 0  else {
            ErrorLabel.isHidden = false
            ErrorLabel.text = "Please fill all details"
            return
        }
        guard let index = IndexText.text, IndexText.text?.count != 0  else {
            ErrorLabel.isHidden = false
            ErrorLabel.text = "Please fill all details"
            return
        }
        
        if (country == "") {
            country="Sri Lanka"
        }
        
        
        //logic
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension UpdateProfileVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count}
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return self.country=dataSource[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
}
