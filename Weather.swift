//
//  Weather.swift
//  LemonadeStand
//
//  Created by Belinda Heliot on 11/19/14.
//  Copyright (c) 2014 Belinda Heliot. All rights reserved.
//

import UIKit

struct Weather {
    var todaysWeather: Int = Int(arc4random_uniform(UInt32(3)))
    
    func numberOfCustomers () -> Int {
        var todaysCustomersCount: Int = 0
        switch todaysWeather {
        case 0:
            todaysCustomersCount = Int(arc4random_uniform(UInt32(11))) - 3
        case 1:
            todaysCustomersCount = Int(arc4random_uniform(UInt32(11)))
        case 2:
            todaysCustomersCount = Int(arc4random_uniform(UInt32(11))) + 3
        default:
            todaysCustomersCount = Int(arc4random_uniform(UInt32(11))) + 3
        }
        return todaysCustomersCount
    }
    
    func imageIcon () -> UIImage {
        var todaysWeatherIcon: UIImage! = UIImage(named: "Cold")
        switch todaysWeather {
        case 0:
            todaysWeatherIcon = UIImage(named: "Cold")
        case 1:
            todaysWeatherIcon = UIImage(named: "Mild")
        case 2:
            todaysWeatherIcon = UIImage(named: "Warm")
        default:
            todaysWeatherIcon = UIImage(named: "Warm")
        }
        return todaysWeatherIcon
    }
}