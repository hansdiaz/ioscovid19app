
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
import CoreLocation



class HomeVC: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var formStackView: UIStackView!
    
    
    
    @IBOutlet weak var lowLabel: UILabel!
    
    @IBOutlet weak var midLabel: UILabel!
    
    @IBOutlet weak var highLabel: UILabel!
    
    
    
    @IBOutlet weak var MessageButton: UIButton!
    
    @IBOutlet weak var MessageLabel: UILabel!
    
    // Used to start getting the users location
    let locationManager = CLLocationManager()
    
    var notifSummary=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //load the latest notification
        
        let db = Firestore.firestore()

        db.collection("notification").document("update").getDocument { (document, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                let documentData=document?.data()
                self.notifSummary = documentData?["notiftopic"]! as! String
                self.MessageLabel.text=self.notifSummary
                
          }
        }
        
 
        
        //setup the scrollview constraints
        
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
               
                
        
        //get data from firebase on the count of infectious people from firestore to count
        let low="low possibility"
        let mid="mid possibility"
        let high="high possibility"
        
        var lowCount=0
        var midCount=0
        var highCount=0
        
        
        
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
            highCount = highCount+querySnapshot!.count
            self.highLabel.text=String(highCount)
          }
        }
        
        
        
        //locationsetup
        
        // For use when the app is open & in the background
        locationManager.requestAlwaysAuthorization()
        
        // For use when the app is open
        //locationManager.requestWhenInUseAuthorization()
        
        // If location services is enabled get the users location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
            locationManager.startUpdatingLocation()
        }
  
    }
                
        
    @IBAction func messageAction(_ sender: Any) {
        
        
    }
    
    
    //location gaining functions
    // Print out the location to the console
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Current user location:",location.coordinate)
        }
    }
    
    // If we have been deined access give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            showLocationDisabledPopUp()
        }
    }
    
    // Show the popup to the user if we have been deined access
    func showLocationDisabledPopUp() {
        let alertController = UIAlertController(title: "Background Location Access Disabled",
                                                message: "In order to show you possible safety areas we need your location",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

