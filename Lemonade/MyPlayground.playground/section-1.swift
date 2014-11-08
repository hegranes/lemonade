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

