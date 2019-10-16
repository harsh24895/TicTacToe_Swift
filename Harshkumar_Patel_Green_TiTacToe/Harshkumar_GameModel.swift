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
    
    var lastPlayed = ""
    var whoWon = ""
    var numberOfMovesplayed = 0
    var squareContents = Array(repeating: "", count: 10)
    
    var orderofMOves = [Int]()
    let winnigCombination=[
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [1,4,7],
    [2,5,8],
    [3,6,9],
    [1,5,9],
    [3,5,7],
    ]
    
    func playMove(tag: Int) {
        orderofMOves.append(tag)
        
        squareContents[tag] = whoseTurn
        
        lastPlayed = whoseTurn
        if(whoseTurn == "X") {
            whoseTurn = "O"
        }else{
            whoseTurn = "X"
        }
        numberOfMovesplayed += 1
    }
    
    func isGamefinished() -> Bool{
        if(numberOfMovesplayed < 5){
            return false
        }
        for winningCombo in winnigCombination{
            let index1 = winningCombo[0]
            let index2 = winningCombo[1]
            let index3 = winningCombo[2]
            
            if (squareContents[index1] == lastPlayed && squareContents[index2] == lastPlayed && squareContents[index3] == lastPlayed){
                whoWon = lastPlayed
                saveGame()
                return true
            }

        }
        if(numberOfMovesplayed == 9){
            saveGame()
            return true
        }
        
        return false
    }
    func saveGame (){
        var numberOfGamesPlayed = UserDefaults.standard.integer(forKey: Constants.NUM_GAMES)
        
        numberOfGamesPlayed += 1
        
        UserDefaults.standard.set(numberOfGamesPlayed, forKey: Constants.NUM_GAMES)
        UserDefaults.standard.set(whoWon, forKey: Constants.WHO_WIN + String(numberOfGamesPlayed))
        
        let date = Date()
        
        UserDefaults.standard.set(date,forKey: Constants.DATE_TIME + String(numberOfGamesPlayed))
        UserDefaults.standard.set(orderofMOves,forKey: Constants.ORDER_OF_MOVES + String(numberOfGamesPlayed))
        print("game saved")
    }
}
