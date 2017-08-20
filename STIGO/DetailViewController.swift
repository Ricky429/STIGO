//
//  DetailViewController.swift
//  STIGO
//
//  Created by Erik Hemingway on 8/19/17.
//  Copyright © 2017 Erik Hemingway. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    var sentData1: String!
    
    var latitude = 0.0
    var longitude = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        detailTitle.text = sentData1
        
        self.navigationItem.title = sentData1
        
        if detailTitle.text == "Gold Line" {
            
            latitude = 33.91
            longitude = -84.27
            
        }
        
        if detailTitle.text == "Red Line" {
            
            latitude = 33.94
            longitude = -84.36
            
        }
        
        if detailTitle.text == "Green Line" {
            
            latitude = 33.77
            longitude = -84.42
            
        }
        
        if detailTitle.text == "Blue Line" {
            
            latitude = 33.77
            longitude = -84.23
            
        }
        
        let span = MKCoordinateSpanMake(0.003, 0.003)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(latitude, longitude), span: span)
        map.setRegion(region, animated: true)
        
        let pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let objectAnn = MKPointAnnotation()
        objectAnn.coordinate = pinLocation
        objectAnn.title = detailTitle.text
        self.map.addAnnotation(objectAnn)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func directions(_ sender: AnyObject) {
        
        UIApplication.shared.open(URL(string: "http://maps.apple.com/maps?daddr=\(latitude),\(longitude)")!)
        
    }
    

}
