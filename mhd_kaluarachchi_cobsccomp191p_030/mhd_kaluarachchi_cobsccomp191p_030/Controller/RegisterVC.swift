//
//  ViewController.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/13/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit
import Foundation

class RegisterVC: UIViewController{
    
    private let dataSource = ["Student","Academic Staff","Non academic Staff"]

    @IBOutlet weak var userPicker: UIPickerView!
    
    @IBOutlet weak var FirstName: UITextField!
    
    @IBOutlet weak var LastName: UITextField!
    
    @IBOutlet weak var EmailAddress: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    //message popping validator labels
    
    
    @IBOutlet weak var FirstNameLabel: UILabel!
    
    @IBOutlet weak var LastNameLabel: UILabel!
    
    @IBOutlet weak var EmailAddressLabel: UILabel!
    
    @IBOutlet weak var PasswordLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirstNameLabel.isHidden=true
        LastNameLabel.isHidden=true
        EmailAddressLabel.isHidden=true
        PasswordLabel.isHidden=true
        // Do any additional setup after loading the view.
        userPicker.delegate=self
        userPicker.dataSource=self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func createNow(_ sender: Any) {
        FirstNameLabel.isHidden=false
        LastNameLabel.isHidden=false
        EmailAddressLabel.isHidden=false
        PasswordLabel.isHidden=false    }
    
}

extension RegisterVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count}
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //datasource[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
}

