//
//  ViewController.swift
//  TicTacToe
//
//  Created by sophia on 6/16/19.
//  Copyright © 2019 fyunka. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    // started tag from 1 bc default is 0
    
    @IBOutlet var winnerLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: Any) {
        
        activeGame = true
        
        activePlayer = 1
    
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 1..<10 {
            // ? is an optional casting
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
                
            }
            
            winnerLabel.isHidden = true
            
            playAgainButton.isHidden = true
            
            winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
            
            playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
            
        }
        
    }
    
    var activeGame = true
    //a var that keeps track of who's go it is
    // intitially set to 1, i.e. 1 is noughts, 2 is crosses
    var activePlayer = 1
    // to avoid crosses overtake noughts and vice versa
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0 - represent empty, 1 - noughts, 2 - crosses
    //to store winning combinations 0, 1, 2 - x top row
    // 3, 4, 5 - x middle row
    // 6, 7, 8 - x bottow row
    // [0, 3, 6], [1, 4, 7], [2, 5, 8] - y row
    // [0, 4, 8], [2, 4, 6]  - diagonal
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBAction private func buttonPressed(_ sender: Any) {
        
        let activePosition = (sender as AnyObject).tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1 {
                
                (sender as AnyObject).setImage(UIImage(named: "nought.png"), for: [])
                
                activePlayer = 2
                
            } else {
                
                (sender as AnyObject).setImage(UIImage(named: "cross.png"), for: [])
                
                activePlayer = 1
                
            }
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    // We have a winner!
                    
                    activeGame = false
                    
                    winnerLabel.isHidden = false
                    
                    playAgainButton.isHidden = false
                    
                    // o is the number of the winner
                    if gameState[combination[0]] == 1 {
                        
                     winnerLabel.text = "Noughts have won!"
                  
                    } else {
                        
                        winnerLabel.text = "Crosses have won!"
                        
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                        
                    })
                    
                }
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        winnerLabel.isHidden = true
        
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
    }


}

