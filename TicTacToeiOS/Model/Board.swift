//
//  Board.swift
//  TicTacToeiOS
//
//  Created by Keiph Maurice on 6/1/20.
//  Copyright © 2020 Keith Maurice. All rights reserved.
//

import Foundation

struct Board {
    let turn: Icon
    let spots: [Icon]
    let status: String
    let lastMove: Int
    
    var legalMoves:[Int] {
        return spots.indices.filter { spots[$0] == .E }
    }
    var winner: Bool {
        return checkRowWin() || checkColumnWin() || checkDiagonalWin()
    }
    
    var draw: Bool {
        return !winner && legalMoves.count == 0
    }
    
    init(spots:[Icon] = [.E, .E, .E, .E, .E, .E, .E, .E, .E], turn: Icon = .X, lastMove: Int = -1) {
        self.spots = spots
        self.turn = turn
        self.status = "\(turn.rawValue) turn to move"
        self.lastMove = lastMove
    }
    
    func move(_ location: Int) -> Board {
        let oldSpots = spots
        
        let newSpots = oldSpots.enumerated().compactMap({ index,spot -> Icon in
            index == location ? turn : spot
        } )
        
        return Board(spots: newSpots, turn: turn.opposite, lastMove: location)
    }
    
    func checkSet(set: (Icon,Icon,Icon)) -> Bool  {
        switch set {
            case (.O,.O,.O), (.X,.X,.X):
                   return true
            default:
                return false
        }
    }
    
    func checkRowWin() -> Bool {
        let row1 = checkSet(set:(spots[0],spots[1], spots[2]))
        let row2 = checkSet(set:(spots[3],spots[4], spots[5]))
        let row3 = checkSet(set:(spots[6],spots[7], spots[8]))
        return row1 || row2 || row3
    }
    
    func checkColumnWin() -> Bool {
           let column1 = checkSet(set:(spots[0],spots[3], spots[6]))
           let column2 = checkSet(set:(spots[1],spots[4], spots[7]))
           let column3 = checkSet(set:(spots[2],spots[5], spots[8]))
           
           return column1 || column2 || column3
       }
    
    func checkDiagonalWin() -> Bool {
           let diagonal1 = checkSet(set:(spots[0],spots[4], spots[8]))
           let diagonal2 = checkSet(set:(spots[2],spots[4], spots[6]))
           
           return diagonal1 || diagonal2
       }
}
