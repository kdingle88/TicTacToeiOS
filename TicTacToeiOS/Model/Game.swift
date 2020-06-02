//
//  Game.swift
//  TicTacToeiOS
//
//  Created by Keiph Maurice on 6/2/20.
//  Copyright © 2020 Keith Maurice. All rights reserved.
//

import Foundation

struct Game {
    var board = Board()
    
    func legalMove(spot: Int) -> Bool {
        if board.legalMoves.contains(spot) && !board.winner && !board.draw {
            return true
            
        }
        else {
            return false
        }
        
    }
    
    func turnIconImageText() -> String {
        if board.turn == .X {
            return "Cross.png"
        }
            
        else {
            return "Nought.png"
        }
    }
    
    func getBoardStatus() -> String {
        return board.status
    }
    
    mutating func begin(){
        board = Board()
    }
    
    func getWinner() -> Bool {
        return board.winner
    }
    
    func getTurn() -> Icon {
        return board.turn 
    }
    
    func getDraw() -> Bool {
        return board.draw
    }
    
    mutating func getMove(spot:Int) {
        board = board.move(spot)
    }
    
}
