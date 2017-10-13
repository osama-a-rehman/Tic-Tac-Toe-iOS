//
//  ResultVC.swift
//  Tic Tac Toe
//
//  Created by Osama Mac on 10/13/17.
//  Copyright © 2017 Osama Mac. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {

    @IBOutlet weak var labelMatchResult: UILabel!
    
    @IBOutlet weak var resultViewLabel: UIView!
    
    var result: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultViewLabel.layer.cornerRadius = 15
        resultViewLabel.clipsToBounds = true
        
        if result == -1 {
            labelMatchResult.text = "Match Drawn !"
        }else {
            labelMatchResult.text = "Player \(result) has won !"
        }
    }
    
    @IBAction func btnPlayAgainPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: {
            
        })
    }

}
