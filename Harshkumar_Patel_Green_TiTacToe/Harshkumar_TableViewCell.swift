//
//  Harshkumar_TableViewCell.swift
//  Harshkumar_Patel_Green_TiTacToe
//
//  Created by Harshkumar Patel on 2019-09-25.
//  Copyright © 2019 Harshkumar Patel. All rights reserved.
//

import UIKit

class Harshkumar_TableViewCell: UITableViewCell {

    @IBOutlet weak var winLossImage: UIImageView!
    
    
    @IBOutlet weak var whoWonLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    var gameData : GameData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
