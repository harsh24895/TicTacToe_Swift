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
    
    //its mark for outlet
    @IBOutlet weak var gameStatelabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
            gameStatelabel.text = gamemodel.whoseTurn + "Turn"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func squareTouched(_ sender: UIButton) {
        print("Touched")
        print(sender.tag)
        if(sender.currentTitle == "X"||sender.currentTitle == "O"){
            
        }else{
            sender.setTitle(gamemodel.whoseTurn, for: .normal)
            gamemodel.playMove(tag: sender.tag)
            //check if the game is finished
            let gameFinished = gamemodel.isGamefinished()
            
            if(gameFinished){
                let whoWon = gamemodel.whoWon
                gameStatelabel.text = whoWon + "Won"
                print(whoWon)
            }else{
                gameStatelabel.text = gamemodel.whoseTurn + "'sTurn"
            }
            

        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
