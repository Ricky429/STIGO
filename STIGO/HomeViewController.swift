//
//  HomeViewController.swift
//  STIGO
//
//  Created by Erik Hemingway on 8/19/17.
//  Copyright © 2017 Erik Hemingway. All rights reserved.
//

import UIKit
import CoreLocation
import CoreMotion

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var batteryImage: UIImageView!
    @IBOutlet weak var tiltLbl: UILabel!
    
    var locationManager = CLLocationManager()
    var motionManager = CMMotionManager()
    
    var timer = Timer()
    var counter = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        speedLbl.text = "\(0.0)"
        batteryImage.image = UIImage(named: "Battery-100.jpg")
        tiltLbl.text = "STIGO is currently stable"
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        reloadInputViews()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(HomeViewController.updateCounter), userInfo: nil, repeats: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        motionManager.gyroUpdateInterval = 0.2
        
        motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data {
                
                if myData.rotationRate.x >= 1 || myData.rotationRate.y >= 1 || myData.rotationRate.z >= 1 {
                    
                    self.tiltLbl.text = "STIGO is tilting too much!!"
                    
                } else {
                    
                    self.tiltLbl.text = "STIGO is currently stable"
                    
                }
                
            }
        }
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        var speed: Double = 0
        var convertedSpeed: Double
        
        let rawSpeed:Double = locations[0].speed
        let accuracy: Double = locations[0].horizontalAccuracy
        
        if accuracy > 0 && accuracy < 80 {
            
            if rawSpeed >= 0 {
                
                speed = round(rawSpeed)
                convertedSpeed = speed * 2.237
                speedLbl.text = String(convertedSpeed);
                
            }
        }
        
    }
    
    func updateCounter() {
        
        counter -= 1
        
        if counter == 75 {
            
            batteryImage.image = UIImage(named: "Battery-75.jpg")
            
        } else if (counter == 50) {
            
            batteryImage.image = UIImage(named: "Battery-50.jpg")
            
        } else if (counter == 25) {
            
            batteryImage.image = UIImage(named: "Battery-25.png")
            
        } else if (counter == 0) {
            
            batteryImage.image = UIImage(named: "Battery-0.png")
            counter = 100
            
        }
        
        
    }


}
