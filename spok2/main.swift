//
//  main.swift
//  spok2
//
//  Created by Ivan Karpovich on 17.12.21.
//

import Foundation

class main
{
    var rules : [String]
    var game : Game
    var helper: Help
    
    func start() {
        game.moves()
    }
    
    init() {
        rules = readLine()!.split(separator: " ").compactMap {String($0)}
        while rules.count < 3 || rules.count % 2 == 0 {
            if rules.count < 3{
                print("length should be more then 3, example: 1 2 3")
            } else if rules.count % 2 == 0 {
                print("must be odd, example: 1 2 3 4 5")
            }
            rules = readLine()!.split(separator: " ").compactMap {String($0)}
        }
        game = Game(condition:rules)
        helper = Help(condition:rules)
    }
}

var start1 = main()
start1.start()
