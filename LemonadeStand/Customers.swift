//
//  Customers.swift
//  LemonadeStand
//
//  Created by Belinda Heliot on 11/13/14.
//  Copyright (c) 2014 Belinda Heliot. All rights reserved.
//

import Foundation

struct Customer {
    func determineRange () -> Int {
        let randomNumber = arc4random_uniform(UInt32(10)) + 1
        let preference:Float = Float(randomNumber) / 10.0
        println("customer's preference: \(preference)")
        var preferenceRange = 0
        if preference > 0.0 && preference <= 0.4 {
            preferenceRange = 1 //Acidic Lemonade
        }
        else if preference > 0.4 && preference <= 0.6 {
            preferenceRange = 2 //Equally Proportioned Lemonade
        }
        else {
            preferenceRange = 3 //Diluted Lemonade
        }
        println("customer's preference range: \(preferenceRange)")
        return preferenceRange
    }
}