// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//purchasing lemons...
var wallet = 10
var lemons = 1
var sugarCubes = 1
var lemonsCost = 2
var sugarCubesCost = 1
var walletLabel = "$\(wallet)"

if wallet >= 2 {
    wallet -= lemonsCost
    walletLabel = "$\(wallet)"
    lemons += 1
    
}


//batch computations

var lemonsMix = 1
var lemonFloat:Float = Float(lemonsMix)

var sugarsMix = 3
var sugarFloat = Float(sugarsMix)


var batchRatio = lemonFloat / sugarFloat


var randomDailyCustomers = Int(arc4random_uniform(UInt32(10)))

var randomFloat = Float(randomDailyCustomers) / 10


