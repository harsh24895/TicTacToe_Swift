//
//  Harshkumar_GameModel.swift
//  Harshkumar_Patel_Green_TiTacToe
//
//  Created by Harshkumar Patel on 2019-10-09.
//  Copyright © 2019 Harshkumar Patel. All rights reserved.
//

import Foundation

class Harshkumar_GameModel{
    var whoseTurn="X"
    var numberOfMovesplayed = 0
    var lastPlayed = ""
    var whoWon = ""
    var squareContents = Array(repeating: "", count: 10)
    let winnigCombination=[
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [1,4,7],
    [2,5,8],
    [3,6,9],
    [1,5,9],
    [3,5,7]]
    
    func playMove(tag: Int) {
        squareContents[tag] = whoseTurn
        lastPlayed = whoseTurn
        if(whoseTurn == "X") {
            whoseTurn = "0"
        }else{
            whoseTurn = "X"
        }
        numberOfMovesplayed += 1
    }
    
    func isGamefinished() -> Bool{
        if(numberOfMovesplayed < 5){
            return false
        }else if(numberOfMovesplayed == 9){
            return true
        }
        for winningCombo in winnigCombination{
            let index1 = winningCombo[0]
            let index2 = winningCombo[1]
            let index3 = winningCombo[2]
            
            if (squareContents[index1] == lastPlayed && squareContents[index2] == lastPlayed && squareContents[index3] == lastPlayed){
                whoWon = lastPlayed
                return true
            }

        }
        
        return false
    }
}
