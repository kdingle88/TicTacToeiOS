//
//  Icon.swift
//  TicTacToeiOS
//
//  Created by Keiph Maurice on 6/1/20.
//  Copyright © 2020 Keith Maurice. All rights reserved.
//

import Foundation

enum Icon: String {
    case O = "O"
    case X = "X"
    case E = " "
    
    var opposite: Icon {
        switch self {
        case .O:
        return .X
        case .X:
        return .O
        case .E:
        return .E
        }
    }
}
