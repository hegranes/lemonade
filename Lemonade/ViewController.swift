//
//  ViewController.swift
//  Lemonade
//
//  Created by Jonathan Hegranes on 07/11/14.
//  Copyright (c) 2014 @hegranes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var walletLabel: UILabel!
    @IBOutlet weak var lemonSuppliesLabel: UILabel!
    @IBOutlet weak var sugarCubesSuppliesLabel: UILabel!
    @IBOutlet weak var lemonsMixLabel: UILabel!
    @IBOutlet weak var sugarCubesMixLabel: UILabel!
    
    //Key Variables
    var wallet = 10
    var lemons = 1
    var sugarCubes = 1
    var lemonsCost = 2
    var sugarCubesCost = 1
    var lemonsInTheMix = 0
    var sugarCubesInTheMix = 0
    var batchRatio:Float = 0.000
    var dailyRevenue = 0
    var dailyUnits = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //
    // Start the Day Simulation
    //
    
    @IBAction func startTheDayButtonPressed(sender: AnyObject) {
        println("start button pressed")
        println("beginning wallet balance is $\(wallet)")
        batchMixing()
        customerSimulation()
        startNewDay()
    }
    
    
    //
    //Shopping Actions
    //
    
    @IBAction func addLemonsButtonPressed(sender: AnyObject) {
        if wallet >= lemonsCost {
            wallet -= lemonsCost
            walletLabel.text = "$\(wallet)"
            lemons += 1
            lemonSuppliesLabel.text = "\(lemons)"
        } else {
            showAlertWithText(header: "Easy Big Spender", message: "You don't have enough cash to buy any more lemons.")
        }
    }
    
    
    @IBAction func removeLemonsButtonPressed(sender: AnyObject) {
        if lemons > 0 {
            wallet += lemonsCost
            walletLabel.text = "$\(wallet)"
            lemons -= 1
            lemonSuppliesLabel.text = "\(lemons)"
        } else {
            showAlertWithText(header: "No More Lemons", message: "You can't remove what you don't have, and you sir don't have any more lemons.")
        }
    }
    
    
    @IBAction func addSugarCubesButtonPressed(sender: AnyObject) {
        if wallet >= sugarCubesCost {
            wallet -= sugarCubesCost
            walletLabel.text = "$\(wallet)"
            sugarCubes += 1
            sugarCubesSuppliesLabel.text = "\(sugarCubes)"
        } else {
            showAlertWithText(header: "Easy Big Spender", message: "You may be sweet, but not sweet enough to not pay for your sugar.")
        }
    }
    
    
    @IBAction func removeSugarCubesButtonPressed(sender: AnyObject) {
        if sugarCubes > 0 {
            wallet += sugarCubesCost
            walletLabel.text = "$\(wallet)"
            sugarCubes -= 1
            sugarCubesSuppliesLabel.text = "\(sugarCubes)"
        } else {
            showAlertWithText(header: "No More Sugar", message: "Sorry bro.  You don't have any sugar to get rid of...")
        }
    }
    
    
    //
    //Mixing Actions
    //
    
    @IBAction func addLemonsToMixButtonPressed(sender: AnyObject) {
        if lemons > 0 {
            lemons -= 1
            lemonSuppliesLabel.text = "\(lemons)"
            lemonsInTheMix += 1
            lemonsMixLabel.text = "\(lemonsInTheMix)"
        } else {
            showAlertWithText(header: "Too Sweet", message: "You gotta buy some lemons before you can add any to today's batch.")
        }
        
    }
    
    
    @IBAction func removeLemonsFromMixButtonPressed(sender: AnyObject) {
        if lemonsInTheMix > 0 {
            lemons += 1
            lemonSuppliesLabel.text = "\(lemons)"
            lemonsInTheMix -= 1
            lemonsMixLabel.text = "\(lemonsInTheMix)"
        } else {
            showAlertWithText(header: "Warning", message: "You don't have any lemons left to remove.  Make this lemonade more sour :)")
        }
    }
    
    
    @IBAction func addSugarCubesToMixButtonPressed(sender: AnyObject) {
        if sugarCubes > 0 {
            sugarCubes -= 1
            sugarCubesSuppliesLabel.text = "\(sugarCubes)"
            sugarCubesInTheMix += 1
            sugarCubesMixLabel.text = "\(sugarCubesInTheMix)"
        } else {
            showAlertWithText(header: "Too Sour", message: "You gotta buy some sugar before you can add any more to today's batch.")
        }
    }
    
    
    @IBAction func removeSugarCubesFromMixButtonPressed(sender: AnyObject) {
        if sugarCubesInTheMix > 0 {
            sugarCubes += 1
            sugarCubesSuppliesLabel.text = "\(sugarCubes)"
            sugarCubesInTheMix -= 1
            sugarCubesMixLabel.text = "\(sugarCubesInTheMix)"
        } else {
            showAlertWithText(header: "Warning", message: "You don't have any sugar cubes left to remove.  Make this lemonade more sweet.  Jeez.")
        }
    }
    
    
    //
    //Helper Functions
    //
    
    func showAlertWithText (header : String = "Warning", message : String) {
        
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    func batchMixing() {
        
        var lemonRatio:Float = Float(lemonsInTheMix)
        var sugarRatio:Float = Float(sugarCubesInTheMix)
        
        batchRatio = lemonRatio / sugarRatio
        
        if batchRatio > 1 {
            println("the batch ratio is \(batchRatio) -- sour")
        } else if batchRatio == 1 {
            println("the batch radio is \(batchRatio) -- balanced")
        } else if batchRatio < 1 {
            println("the batch ratio is \(batchRatio) -- sweet")
        }
        

    }

    
    func customerSimulation() {
        
        var randomDailyCustomers = Int(arc4random_uniform(UInt32(10)))
        
        var dailyCustomers = randomDailyCustomers + 1
        println("today there were \(dailyCustomers) customers")
        
        for var index = 0; index < dailyCustomers; ++index {
            var randomTaste = Int(arc4random_uniform(UInt32(10)))
            var tasteFloat = (Float(randomTaste) + 1) / 10
            
            if tasteFloat <= 0.4 && batchRatio > 1 {
                dailyRevenue += 1
                dailyUnits += 1
                println("customer #\(index): one sour lemonade sold")
            } else if tasteFloat > 0.4 && tasteFloat <= 0.6 && batchRatio == 1 {
                dailyRevenue += 1
                dailyUnits += 1
                println("customer #\(index): one balanced lemonade sold")
            } else if tasteFloat > 0.6 && batchRatio < 1 {
                dailyRevenue += 1
                dailyUnits += 1
                println("customer #\(index): one sweet lemonade sold")
            } else {
                dailyRevenue += 0
                println("customer #\(index): no lemonade sold")
            }
            

        }

        println("today's revenue was $\(dailyRevenue)")
        wallet += dailyRevenue
        
        showAlertWithText(header: "Today's Recap", message: "Today there were \(dailyCustomers) customers and you sold \(dailyUnits) for $\(dailyRevenue) in revenue.  You now have $\(wallet) to start a new day.")
    }
    
    
    func startNewDay() {
        lemonsInTheMix = 0
        lemonsMixLabel.text = "\(lemonsInTheMix)"
        sugarCubesInTheMix = 0
        sugarCubesMixLabel.text = "\(sugarCubesInTheMix)"
        walletLabel.text = "$\(wallet)"
        println("starting new day with a wallet balance of $\(wallet)")
        dailyUnits = 0
        dailyRevenue = 0
    }
    
    
}

