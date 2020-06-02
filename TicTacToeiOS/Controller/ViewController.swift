//
//  ViewController.swift
//  TicTacToeiOS
//
//  Created by Keiph Maurice on 6/1/20.
//  Copyright © 2020 Keith Maurice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var board = Board()
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet var spots: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetBoard()
        
    }
    
    @IBAction func move(_ sender: UIButton) {
        

        if board.legalMoves.contains(sender.tag) {
            if board.turn == .X {
                
                sender.setImage(UIImage(named: "Cross.png"), for: .normal)
                
                messageLabel.text = "O turn to move"
                board = board.move(sender.tag)
                
            } else {
                
                sender.setImage(UIImage(named: "Nought.png"), for: .normal)
                
                messageLabel.text = "X turn to move"
                
                board = board.move(sender.tag)
            }
            
        }
        if board.winner {
            messageLabel.isHidden = false
            messageLabel.text = "\(board.turn.opposite) wins the game!"
            playAgainButton.isHidden = false
        }
        
    }
    
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        resetBoard()

    }
    
    func resetBoard() {
        messageLabel.text = "X moves first!"
        playAgainButton.isHidden = true
        board = Board()
        
        for spot in spots {
            spot.setImage(nil, for: .normal)
        }
    }
    
   
}

