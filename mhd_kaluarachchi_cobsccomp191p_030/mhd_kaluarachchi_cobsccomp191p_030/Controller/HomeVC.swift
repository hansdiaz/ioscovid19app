
//
//  HomeVC.swift
//  mhd_kaluarachchi_cobsccomp191p_030
//
//  Created by user180175 on 9/13/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit
import Foundation

import Firebase
import FirebaseAuth
import FirebaseFirestore



class HomeVC: UIViewController{
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var formStackView: UIStackView!
    
    
    
    @IBOutlet weak var lowLabel: UILabel!
    
    @IBOutlet weak var midLabel: UILabel!
    
    @IBOutlet weak var highLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.translatesAutoresizingMaskIntoConstraints = false;
               
               self.scrollView.addSubview(formStackView)
               
               self.formStackView.translatesAutoresizingMaskIntoConstraints=false
               
               self.formStackView.alignment = .fill
               self.formStackView.distribution = .fill
               formStackView.axis = .vertical
               formStackView.spacing = 0
               
               self.formStackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor,constant: 0).isActive=true
               self.formStackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor,constant: 0).isActive=true
               
               self.formStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor,constant: 20).isActive=true
               self.formStackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive=true
               
               formStackView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
               
                
        
        //get data from firebase on the count of infectious people
        let low="low possibility"
        let mid="mid possibility"
        let high="high possibility"
        
        var lowCount=0
        var midCount=0
        var highCount=0
        
        let db = Firestore.firestore()
        
        db.collection("users").whereField("health", isEqualTo: low).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                lowCount = lowCount+querySnapshot!.count
                self.lowLabel.text=String(lowCount)
            }
        }
        db.collection("users").whereField("health", isEqualTo: mid).getDocuments() { (querySnapshot, err) in
          if let err = err {
              print("Error getting documents: \(err)")
          } else {
            midCount = midCount+querySnapshot!.count
            self.midLabel.text=String(midCount)
          }
        }
        db.collection("users").whereField("health", isEqualTo: high).getDocuments() { (querySnapshot, err) in
          if let err = err {
              print("Error getting documents: \(err)")
          } else {
              highCount = midCount+querySnapshot!.count
            self.highLabel.text=String(highCount)
          }
        }
        
        
        
        
    }
                
        
        
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

