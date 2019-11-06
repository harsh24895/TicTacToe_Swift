//
//  Harshkumar_ViewController.swift
//  Harshkumar_Patel_Green_TiTacToe
//
//  Created by Harshkumar Patel on 2019-10-09.
//  Copyright © 2019 Harshkumar Patel. All rights reserved.
//

import UIKit

class Harshkumar_ViewController: UIViewController {
    
    var gamemodel = Harshkumar_GameModel()
    var gameFinished = false
    var replayPastGame = false
    var pastGamedata : GameData?
    
    //its mark for outlet
    @IBOutlet weak var gameStatelabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
//            gameStatelabel.text = gamemodel.whoseTurn + "Turn"
        // Do any additional setup after loading the view.
        
        if(replayPastGame){
            gamemodel.isPastGame = true
            navigationItem.title = "Past Game"
        
        let pastGameMoves = (pastGamedata?.orderOfMoves)!
        
            var delay : Double = Double(0)
        
            for i in pastGameMoves{
                delay = delay + 1.0
            
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    let button = self.view.viewWithTag(i)
                    self.squareTouched(button as! UIButton)

                })
            }
    } else{
            
        }
    }
    

    @IBAction func squareTouched(_ sender: UIButton) {
        print("Touched")
        print(sender.tag)
        if(sender.currentTitle == "X" || sender.currentTitle == "O" || gameFinished){
            
        }else{
            sender.setTitle(gamemodel.whoseTurn, for: .normal)
            gamemodel.playMove(tag: sender.tag)
            //check if the game is finished
            gameFinished = gamemodel.isGamefinished()
            
            if(gameFinished){
                let whoWon = gamemodel.whoWon
                if(whoWon == ""){
                    gameStatelabel.text="Draw!!!"
                }else{
                gameStatelabel.text = whoWon + "Won"
                }
                
                
            
            }else{
                gameStatelabel.text = gamemodel.whoseTurn + "'sTurn"
            }
            

        }
    }
   

}
