//
//  CastaneaService.swift
//  KastanienApp
//
//  Created by Adrian Stabiszewski on 11.06.15.
//  Copyright (c) 2015 OpenData Heilbronn. All rights reserved.
//

import Foundation
import AFNetworking

class Tree {

    var lat:Double
    var lon:Double

    init(lat: NSNumber, lon: NSNumber) {
        self.lat = lat.doubleValue
        self.lon = lon.doubleValue
    }
}

class CastaneaService {

    var trees = [Tree]();

    func getTrees(lat:Double, lon: Double, block: ([Tree]) -> Void) -> Void {
            let manager = AFHTTPRequestOperationManager()

            manager.GET( "http://api.openweathermap.org/data/2.5/forecast/daily?id=2953315&units=metric&cnt=3&APPID=d674a6bf4bf958f9bdb4e801416b7df8",
                parameters: nil,
                success: { (operation: AFHTTPRequestOperation!,response: AnyObject!) in
                    self.trees = [Tree]()

                    var res = response as! NSDictionary
                    var weatherList = res["list"] as! NSArray

                    for (weatherElement) in weatherList {
                        var element = weatherElement as! NSDictionary;
                        var temp = element["temp"] as! NSDictionary;

                        var weather = (element["weather"] as! NSArray)[0] as! NSDictionary

//                        self.trees.append(<#newElement: T#>)
                    }
                    block(self.trees);
                },
                failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                    println("Error: " + error.localizedDescription)
            })
    }
}
