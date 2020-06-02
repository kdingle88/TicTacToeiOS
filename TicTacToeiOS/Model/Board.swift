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
    var legalMoves:[Int] {
        return spots.indices.filter { spots[$0] == .E }
    }
    var winner: Bool {
        return spots[0] == spots[1] && spots[0] == spots[2] && spots[0] != .E ||
            spots[3] == spots[4] && spots[3] == spots[5] && spots[3] != .E ||
            spots[6] == spots[7] && spots[6] == spots[8] && spots[6] != .E ||
            spots[0] == spots[3] && spots[0] == spots[6] && spots[0] != .E ||
            spots[1] == spots[4] && spots[1] == spots[7] && spots[1] != .E ||
            spots[2] == spots[5] && spots[2] == spots[8] && spots[2] != .E ||
            spots[0] == spots[4] && spots[0] == spots[8] && spots[0] != .E ||
            spots[2] == spots[4] && spots[2] == spots[6] && spots[2] != .E
    }
    
    var draw: Bool {
        return !winner && legalMoves.count == 0
    }
    
    init(spots:[Icon] = [.E, .E, .E, .E, .E, .E, .E, .E, .E], turn: Icon = .X) {
        self.spots = spots
        self.turn = turn
    }
    
    func move(_ location: Int) -> Board {
    var oldSpots = spots
    oldSpots[location] = turn
    return Board(spots: oldSpots, turn: turn.opposite)
    
    }
    
    
}
