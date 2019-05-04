//
//  Game.swift
//  2048
//
//  Created by Furkan Kaynar on 5.05.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import Foundation

class Game {
    
    var score = 0
    var table = [Int]()
    
    init() {
        table = (1...16).map({ (i) -> Int in
            return 0
        })
        
        generateRandom()
    }
    
    func generateRandom() {
        let availableIndexes = table.indexes(of: 0)
        if availableIndexes.count > 0 {
            let selected = availableIndexes.randomElement()!
            table[selected] = 2
        }
    }
    
}

enum Move {
    case Up, Down, Left, Right
}

