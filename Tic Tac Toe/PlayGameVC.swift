//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Osama Mac on 10/13/17.
//  Copyright © 2017 Osama Mac. All rights reserved.
//

import UIKit

class PlayGameVC: UIViewController {

    var playerTurn = 1
    
    var game = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameRunning = true
    
    let winConditions = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func putInput(_ sender: AnyObject) {
        let btnTag = sender.tag!
        
        if game[btnTag] == 0 && gameRunning == true{
            if playerTurn == 1 {
                sender.setImage(UIImage(named: "Cross.png"), for: .normal)
                
                playerTurn = 2
            }else{
                sender.setImage(UIImage(named: "Nought.png"), for: .normal)
                playerTurn = 1
            }
            
            game[btnTag] = playerTurn
            
            let hasWin = checkWin()
            
            if hasWin {
                print("\((playerTurn == 1 ? 2 : 1)) has won")
                
                gameRunning = false
            }
        }
    }
    
    @IBAction func btnNewGamePressed(_ sender: AnyObject) {
    }
    
    @IBAction func btnExitPressed(_ sender: AnyObject) {
    }
    
    func checkWin() -> Bool{
        for condition in winConditions {
            if game[condition[0]] != 0 && game[condition[0]] == game[condition[1]] && game[condition[1]] == game[condition[2]] {
                return true
            }
        }
        
        return false
    }
}

