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
    
    
   
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var formStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstNameLabel.isHidden=true
        self.lastNameLabel.isHidden=true
        self.emailAddressLabel.isHidden=true
        self.passwordLabel.isHidden=true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false;
        
        self.scrollView.addSubview(formStackView)
        
        self.formStackView.translatesAutoresizingMaskIntoConstraints=false
        
        self.formStackView.alignment = .fill
        self.formStackView.distribution = .fillProportionally
        formStackView.axis = .vertical
        formStackView.spacing = 20.0
        
        self.formStackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor,constant: 20).isActive=true
        self.formStackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor,constant: 20).isActive=true
        
        self.formStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor,constant: 50).isActive=true
        self.formStackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive=true
        
        
        
        //self.formStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive=true
        
        // Do any additional setup after loading the view.
        userPicker.delegate=self
        userPicker.dataSource=self
        
        
        
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func createNow(_ sender: Any) {
        self.firstNameLabel.isHidden=false
        self.lastNameLabel.isHidden=false
        self.emailAddressLabel.isHidden=false
        self.passwordLabel.isHidden=false    }
    
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

