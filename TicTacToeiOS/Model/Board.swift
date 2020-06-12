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
    
    init(spots:[Icon] = [.E, .E, .E, .E, .E, .E, .E, .E, .E,.E,.E,.E,.E,.E,.E,.E,.E,.E,.E,.E,.E,.E,.E,.E,.E], turn: Icon = .X, lastMove: Int = -1) {
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
    
    func checkSet(set: (Icon,Icon,Icon,Icon,Icon)) -> Bool  {
        switch set {
        case (.O,.O,.O,.O,.O), (.X,.X,.X,.X,.X):
                   return true
            default:
                return false
        }
    }
    
    func checkRowWin() -> Bool {
        let row1 = checkSet(set:(spots[0],spots[1], spots[2], spots[3], spots[4]))
        let row2 = checkSet(set:(spots[5],spots[6], spots[7], spots[8], spots[9]))
        let row3 = checkSet(set:(spots[10],spots[11], spots[12], spots[13], spots[14]))
        let row4 = checkSet(set:(spots[15],spots[16], spots[17], spots[18], spots[19]))
        let row5 = checkSet(set:(spots[20],spots[21], spots[22], spots[23], spots[24]))
        
        
        return row1 || row2 || row3 || row4 || row5
    }
    
    func checkColumnWin() -> Bool {
           let column1 = checkSet(set:(spots[0],spots[5], spots[10],spots[15], spots[20]))
           let column2 = checkSet(set:(spots[1],spots[6], spots[11],spots[16], spots[21]))
           let column3 = checkSet(set:(spots[2],spots[7], spots[12],spots[17], spots[22]))
           let column4 = checkSet(set:(spots[3],spots[8], spots[13],spots[18], spots[23]))
           let column5 = checkSet(set:(spots[4],spots[9], spots[14],spots[19], spots[24]))
           
           return column1 || column2 || column3 || column4 || column5
       }
    
    func checkDiagonalWin() -> Bool {
           let diagonal1 = checkSet(set:(spots[0],spots[6], spots[12],spots[18], spots[24]))
           let diagonal2 = checkSet(set:(spots[20],spots[16], spots[12],spots[8], spots[4]))
           
           return diagonal1 || diagonal2
       }
}
