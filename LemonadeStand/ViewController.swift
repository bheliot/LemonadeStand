//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Belinda Heliot on 11/12/14.
//  Copyright (c) 2014 Belinda Heliot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentDollarAmountLabel: UILabel!
    @IBOutlet weak var todaysSalesAmountLabel: UILabel!
    @IBOutlet weak var currentLemonCountLabel: UILabel!
    @IBOutlet weak var currentIceCubeCountLabel: UILabel!
    @IBOutlet weak var purchasedLemonsLabel: UILabel!
    @IBOutlet weak var purchasedIceCubesLabel: UILabel!
    @IBOutlet weak var mixLemonsLabel: UILabel!
    @IBOutlet weak var mixIceCubesLabel: UILabel!
    @IBOutlet weak var todaysWeatherImageView: UIImageView!
    
    //Daily Numbers
    var todaysSalesAmount: Int = 0
    var todaysCustomersCount: Int = 0
    
    //Prices
    let lemonPrice = 2
    let iceCubePrice = 1
    
    //Supplies
    var money = 10
    var lemonsCount = 1
    var iceCubesCount = 1
    var purchaseLemonsCount = 0
    var purchaseIceCubesCount = 0
    var mixedLemons:Float = 0.0
    var mixedIceCubes:Float = 0.0
    var lemonadeRatio:Float = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Buttons
    @IBAction func buyMoreLemonsButtonPressed(sender: UIButton) {
        if money > 1 {
            money -= lemonPrice
            ++purchaseLemonsCount
            ++lemonsCount
            
            purchasedLemonsLabel.text = "\(purchaseLemonsCount)"
            currentLemonCountLabel.text = "\(lemonsCount) Lemons"
            currentDollarAmountLabel.text = "$\(money)"
        }
        else {
            println("You don't have enough money.")
        }
    }
    @IBAction func buyFewerLemonsButtonPressed(sender: UIButton) {
        if purchaseLemonsCount > 0 {
            money += lemonPrice
            --purchaseLemonsCount
            --lemonsCount
        
            purchasedLemonsLabel.text = "\(purchaseLemonsCount)"
            currentLemonCountLabel.text = "\(lemonsCount) Lemons"
            currentDollarAmountLabel.text = "$\(money)"
        }
        else {
            println("You can't buy fewer than zero.")
        }
    }
    @IBAction func buyMoreIceCubesButtonPressed(sender: UIButton) {
        if money > 0 {
            money -= iceCubePrice
            ++purchaseIceCubesCount
            ++iceCubesCount
            
            purchasedIceCubesLabel.text = "\(purchaseIceCubesCount)"
            currentIceCubeCountLabel.text = "\(iceCubesCount) Ice Cubes"
            currentDollarAmountLabel.text = "$\(money)"
        }
        else {
            println("You don't have enough money.")
        }
    }
    @IBAction func buyFewerIceCubesButtonPressed(sender: UIButton) {
        if purchaseIceCubesCount > 0 {
            money += iceCubePrice
            --purchaseIceCubesCount
            --iceCubesCount
        
            purchasedIceCubesLabel.text = "\(purchaseIceCubesCount)"
            currentIceCubeCountLabel.text = "\(iceCubesCount) Ice Cubes"
            currentDollarAmountLabel.text = "$\(money)"
        }
        else {
            println("You can't buy fewer than zero.")
        }
    }
    @IBAction func mixMoreLemonsButtonPressed(sender: UIButton) {
        if lemonsCount > 0 {
            --lemonsCount
            ++mixedLemons
            
            mixLemonsLabel.text = "\(Int(mixedLemons))"
            currentLemonCountLabel.text = "\(lemonsCount) Lemons"
        }
        else {
            println("You don't have enough lemons.")
        }
    }
    @IBAction func mixFewerLemonsButtonPressed(sender: UIButton) {
        if Int(mixedLemons) > 0 {
            ++lemonsCount
            --mixedLemons
            
            mixLemonsLabel.text = "\(Int(mixedLemons))"
            currentLemonCountLabel.text = "\(lemonsCount) Lemons"
        }
        else {
            println("You can't mix fewer than zero.")
        }
    }
    @IBAction func mixMoreIceCubesButtonPressed(sender: UIButton) {
        if iceCubesCount > 0 {
            --iceCubesCount
            ++mixedIceCubes
            
            mixIceCubesLabel.text = "\(Int(mixedIceCubes))"
            currentIceCubeCountLabel.text = "\(iceCubesCount) Ice Cubes"
        }
        else {
            println("You don't have enough ice cubes.")
        }
    }
    @IBAction func mixFewerIceCubesButtonPressed(sender: UIButton) {
        if Int(mixedIceCubes) > 0 {
            ++iceCubesCount
            --mixedIceCubes
            
            mixIceCubesLabel.text = "\(Int(mixedIceCubes))"
            currentIceCubeCountLabel.text = "\(iceCubesCount) Ice Cubes"
        }
        else {
            println("You can't mix fewer than zero.")
        }
    }
    @IBAction func startDayButtonPressed(sender: UIButton) {
        if lemonsCount >= 0 && iceCubesCount >= 0 && mixedLemons > 0 && mixedIceCubes > 0 {
            lemonadeRatio = mixedLemons / mixedIceCubes
            println("Today's lemonade ratio: \(lemonadeRatio)")
            var flavorRange = 0
            if lemonadeRatio > 1.0 {
                flavorRange = 1
            }
            else if lemonadeRatio == 1.0 {
                flavorRange = 2
            }
            else {
                flavorRange = 3
            }
            
            var weatherToday = Weather()
            todaysWeatherImageView.image = weatherToday.imageIcon()
            todaysCustomersCount = weatherToday.numberOfCustomers()
            if todaysCustomersCount == 0 {
                println("You got no customers today.")
            }
            else {
                for var x = 1; x <= todaysCustomersCount; ++x {
                    var currentCustomer = Customer()
                    var customerPrefRange = currentCustomer.determineRange()
                    if customerPrefRange == flavorRange {
                        ++money
                        ++todaysSalesAmount
                        println("You made a sale! Customer's Preference: \(customerPrefRange); Today's Mix: \(flavorRange)")
                    }
                    else {
                        println("No sale.")
                    }
                todaysSalesAmountLabel.text = "$\(todaysSalesAmount)"
                }
            }
            
            purchaseLemonsCount = 0
            purchaseIceCubesCount = 0
            purchasedLemonsLabel.text = "0"
            purchasedIceCubesLabel.text = "0"
            mixedLemons = 0
            mixedIceCubes = 0
            mixLemonsLabel.text = "0"
            mixIceCubesLabel.text = "0"
            currentDollarAmountLabel.text = "$\(money)"
            todaysSalesAmount = 0
            bankruptcyCheck()
        }
        else if lemonsCount < 0 || iceCubesCount < 0 {
           showAlertWithText(message: "You can't have a negative amount of supplies.")
        }
        else if mixedLemons <= 0 || mixedIceCubes <= 0 {
            if money <= 1 && lemonsCount == 0 {
                showAlertWithText(message: "Game Over")
                reset()
            }
            else if money == 0 && iceCubesCount == 0 {
                showAlertWithText(message: "Game Over")
                reset()
            }
            else {
            showAlertWithText(message: "You need to mix ingredients.")
            }
        }
        else {
            println("Some kind of error.")
        }
    }
    //Helper Functions
    func showAlertWithText (header:String = "Error", message:String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func reset() {
        money = 10
        lemonsCount = 1
        iceCubesCount = 1
        currentLemonCountLabel.text = "\(lemonsCount) Lemons"
        currentIceCubeCountLabel.text = "\(iceCubesCount) Ice Cubes"
        currentDollarAmountLabel.text = "$\(money)"
        
        purchaseLemonsCount = 0
        purchaseIceCubesCount = 0
        purchasedLemonsLabel.text = "0"
        purchasedIceCubesLabel.text = "0"
        
        mixedLemons = 0
        mixedIceCubes = 0
        mixLemonsLabel.text = "0"
        mixIceCubesLabel.text = "0"
    }
    
    func bankruptcyCheck() {
        if money == 0 && lemonsCount == 0 {
            showAlertWithText(message: "Game Over")
            reset()
        }
        else if money == 0 && iceCubesCount == 0 {
            showAlertWithText(message: "Game Over")
            reset()
        }
        else {
            println("Still in the Black")
        }
    }
}

