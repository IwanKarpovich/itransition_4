//
//  help.swift
//  spok2
//
//  Created by Ivan Karpovich on 18.12.21.
//

import Foundation

class Help
{
    var rules = [String]()
    var length: Int{ get { rules.count} }
    var gamestep: Int{ get { (rules.count - 1) / 2} }
    
    func printResult(str:String){
        print(str.padding(toLength: 7, withPad: " ", startingAt: 0), terminator: "")
    }
    func helper ()
    {
        print("      ", terminator:" ")
        for i in 0...length - 1 {
            print(rules[i].padding(toLength: 7, withPad: " ", startingAt: 0), terminator: "")
        }
        print()
        for i in 0...length - 1 {
            let computerMove = i
            print(rules[computerMove].padding(toLength: 7, withPad: " ", startingAt: 0), terminator: "  ")
            
            if computerMove - gamestep <= 0 {
                let oppositeCombination = rules [Int(computerMove + 1) ... Int(computerMove + gamestep)]
                
                for j in 0...length - 1 {
                    if oppositeCombination.contains(rules[j]) {
                        printResult(str: "W")
                    } else if rules[j] == rules[i] {
                        printResult(str: "D")
                    } else {
                        printResult(str: "L")
                    }
                }
            } else {
                var losingCombination = rules [Int(computerMove - gamestep ) ... Int(computerMove - 1)]
                
                losingCombination.append(rules[i])
                let oppositeCombination  = rules.filter {
                    !losingCombination.contains($0)
                }
                
                for j in 0...length - 1 {
                    if j - i == 0 {
                        printResult(str: "D")
                    } else if oppositeCombination.contains(rules[j]) {
                        printResult(str: "W")
                    } else {
                        printResult(str: "L")
                    }
                }
            }
            print(" ")
        }
    }
    
    init(condition:[String])
    {
        rules = condition
    }
}
