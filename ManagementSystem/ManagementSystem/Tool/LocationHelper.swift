//
//  LocationHelper.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/4/3.
//

import Foundation
import CoreLocation

class LocationHelper: NSObject {
    let locationManager: CLLocationManager = CLLocationManager()
    
    func reLoactionAction() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 500.0
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            print("定位开始")
        }
    }
    
    func radian(d: Double) -> Double {
         return d * Double.pi/180.0
    }
    
    func angle(r: Double) -> Double {
        return r * 180/Double.pi
    }
    
    func getDistance(lat1: Double, lng1: Double, lat2: Double, lng2: Double) -> Double {
        let EARTH_RADIUS:Double = 6378137.0
        let radLat1:Double = radian(d: lat1)
        let radLat2:Double = radian(d: lat2)
        let radLng1:Double = radian(d: lng1)
        let radLng2:Double = radian(d: lng2)
        let a:Double = radLat1 - radLat2
        let b:Double = radLng1 - radLng2
        var s:Double = 2 * asin(sqrt(pow(sin(a/2), 2) + cos(radLat1) * cos(radLat2) * pow(sin(b/2), 2)))
        s = s * EARTH_RADIUS
        return s
    }
}

extension LocationHelper: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?) {
        NSLog("获取经纬度错误")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let theLocations: NSArray = locations as NSArray
        let location = theLocations.lastObject as! CLLocation
        var latitude = location.coordinate.latitude
        var longitude = location.coordinate.longitude
        latitude = CLLocationDegrees(Float(latitude))
        longitude = CLLocationDegrees(Float(longitude))
        locationManager.stopUpdatingLocation()
    }
}
