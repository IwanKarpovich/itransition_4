//
//  game.swift
//  spok2
//
//  Created by Ivan Karpovich on 18.12.21.
//

import Foundation

class Game {
    var rules = [String]()
    var manMove = -2
    var help: Help
    var length: Int{ get { rules.count} }
    var gameStep: Int{ get { (rules.count - 1) / 2} }
    
    func moves ()  {
        while true {
            let computerMove = Int.random(in: 0 ... length - 1)
            let key = Hash256.transformationToHash(step: rules[computerMove])
            print("Available moves:")
            for i in 1...length {
                print(" \(i) - \(rules[i-1])")
            }
            print(" 0 - Exit")
            print(" ? - Help")
            print("Enter your move:",terminator: "")
            var userInput = readLine()!
            var userNumberInput = (Int(userInput) ?? -1)-1
            while userNumberInput < -1 || userNumberInput > rules.count - 1  {
                if userInput == "?" {
                    help.helper()
                }
                print("enter the number in the range 1 ... \(rules.count)")
                
                userInput = readLine()!
                userNumberInput = (Int(userInput) ?? -1)-1
            }
            manMove = userNumberInput
            if manMove == -1 {
                return
            }
            
            print("Your move - " + rules[manMove])
            print("Computer move - " + rules[computerMove])
            if (computerMove - manMove == 0){
                print("Draw")
            } else if computerMove - gameStep <= 0 {
                let oppositeCombination = rules [Int(computerMove + 1) ... Int(computerMove + gameStep)]
                if oppositeCombination.contains(rules[manMove]) {
                    print("You lose!")
                } else {
                    print("You Win!")
                }
            } else {
                let losingCombination = rules [Int(computerMove - gameStep ) ... Int(computerMove - 1)]
                
                if losingCombination.contains(rules[manMove]) {
                    print("You Win!")
                } else {
                    print("You lose!")
                }
            }
            print(key)
            print("New game")
        }
    }
    
    init(condition:[String])
    {
        rules = condition
        help = Help(condition: condition)
    }
    
}
