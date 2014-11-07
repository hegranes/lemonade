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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Start the Day Simulation
    @IBAction func startTheDayButtonPressed(sender: AnyObject) {
    }
    
    //Shopping Actions
    @IBAction func addLemonsButtonPressed(sender: AnyObject) {
    }
    
    
    @IBAction func removeLemonsButtonPressed(sender: AnyObject) {
    }
    
    
    @IBAction func addSugarCubesButtonPressed(sender: AnyObject) {
    }
    
    
    @IBAction func removeSugarCubesButtonPressed(sender: AnyObject) {
    }
    
    
    //Mixing Actions
    @IBAction func addLemonsToMixButtonPressed(sender: AnyObject) {
    }
    
    
    @IBAction func removeLemonsFromMixButtonPressed(sender: AnyObject) {
    }
    
    
    @IBAction func addSugarCubesToMixButtonPressed(sender: AnyObject) {
    }
    
    
    @IBAction func removeSugarCubesFromMixButtonPressed(sender: AnyObject) {
    }
    
    
    //Helper Functions
    
    

}

