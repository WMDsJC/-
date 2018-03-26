//
//  ViewController.swift
//  吃啥
//
//  Created by Chou on 12/03/2018.
//  Copyright © 2018 Chou. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON


class FindFoodViewController: UIViewController, CLLocationManagerDelegate {

    let API_KEY = "AIzaSyAbb8qQijplpC-ZywFwRVZcqzo_qVDuRT4"
    let MAPS_URL = "https://maps.googleapis.com/maps/api/place/nearbysearch/output"
    
    let locationManager = CLLocationManager()
    let restaurantModel = RestaurantModel()

    
    
    
    @IBAction func sendCurrentLocation(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        //Mark: Alamofire networking
        func getRestaurantData(url: String, parameters: [String : String] ) {
            
            Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
                response in
                if response.result.isSuccess {
                    print("Success!")
                    
                    let restaurantJSON : JSON = JSON(response.result.value!)
                }
                
            }
            
            
            
            
        }
        
        
        
        
        
        //Mark: JSON Parsing
        func updateRestaurantData(json : JSON) {
            
            if let nameResult = json["results"][0]["geometry"]["name"].string {
                
                restaurantModel.restaurantName = nameResult
                
                restaurantModel.openingHours = json["results"][0]["opening_hours"].stringValue
                
                restaurantModel.latitude = json["results"][0]["geometry"]["location"]["lat"].floatValue
                
                restaurantModel.longitude = json["restaurant"][0]["geometry"]["location"]["lng"].floatValue
                
                
                
            }
            
            
            
        }
        
        
        
        
        
        
        //Mark: Location Manager Method
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

